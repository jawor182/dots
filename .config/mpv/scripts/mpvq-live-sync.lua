local utils = require("mp.utils")
local msg = require("mp.msg")

-- Configuration
local queue_file = os.getenv("HOME") .. "/.local/share/mpvq/playlist.m3u"
local current_file = nil
local played_files = {}

-- Function to safely read the queue file
local function read_queue_file()
	local f = io.open(queue_file, "r")
	if not f then
		return {}
	end

	local lines = {}
	for line in f:lines() do
		table.insert(lines, line)
	end
	f:close()
	return lines
end

-- Function to safely write to the queue file
local function write_queue_file(lines)
	-- Create backup
	os.rename(queue_file, queue_file .. ".bak")

	local f = io.open(queue_file, "w")
	if not f then
		os.rename(queue_file .. ".bak", queue_file)
		return false
	end

	for _, line in ipairs(lines) do
		f:write(line, "\n")
	end
	f:close()

	-- Remove backup if successful
	os.remove(queue_file .. ".bak")
	return true
end

-- Function to remove current file from queue
local function remove_current_from_queue()
	if not current_file then
		return
	end

	local lines = read_queue_file()
	local new_lines = {}
	local removed = false

	for _, line in ipairs(lines) do
		if line == current_file and not removed then
			removed = true
			msg.info("Removed from queue: " .. current_file)
		else
			table.insert(new_lines, line)
		end
	end

	if removed then
		write_queue_file(new_lines)
		played_files[current_file] = true
	end
end

-- Function to sync queue with MPV's playlist
local function sync_queue()
	local lines = read_queue_file()
	local current_playlist = {}

	-- Get current MPV playlist
	for i = 0, mp.get_property_number("playlist-count", 0) - 1 do
		local filename = mp.get_property("playlist/" .. i .. "/filename")
		current_playlist[filename] = true
	end

	-- Add new entries from queue file to MPV playlist
	for _, entry in ipairs(lines) do
		if not current_playlist[entry] and not played_files[entry] then
			mp.commandv("loadfile", entry, "append")
			msg.info("Appended to playlist: " .. entry)
		end
	end
end

-- Event handlers
mp.register_event("file-loaded", function()
	current_file = mp.get_property("path")
	msg.info("Now playing: " .. (current_file or "unknown"))
end)

mp.register_event("playback-restart", function()
	current_file = mp.get_property("path")
end)

mp.register_event("end-file", function(event)
	if (event.reason == "eof" or event.reason == "stop") and current_file then
		-- Remove from queue after successful playback
		remove_current_from_queue()
	end
	current_file = nil
end)

-- Set up periodic sync
mp.add_periodic_timer(1.0, sync_queue)

-- Set up key binding to manually remove current file from queue
mp.add_key_binding("Ctrl+r", "remove-from-queue", function()
	if current_file then
		remove_current_from_queue()
		mp.commandv("playlist-remove", "current")
		mp.commandv("playlist-next")
	else
		msg.info("No file currently playing")
	end
end)
