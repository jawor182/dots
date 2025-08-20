-- Keeps mpv's playlist and external queue file in sync
-- Removes entries when they finish, allows skipping, and reloads new queue entries

local msg = require "mp.msg"
local utils = require "mp.utils"

local queue_file = os.getenv("HOME") .. "/.local/share/mpvq/playlist.m3u"

-- Delete the first line from the queue file
local function delete_first_line()
    local cmd = { "sed", "-i", "1d", queue_file }
    local res = utils.subprocess({ args = cmd })
    if res.error then
        msg.error("Failed to update queue file: " .. res.error)
    else
        msg.info("Removed first line from queue file")
    end
end

-- Remove current entry from mpv playlist and queue
local function consume_current()
    if mp.get_property_number("playlist-count", 0) > 0 then
        local fname = mp.get_property("playlist/current/filename")
        mp.commandv("playlist-remove", "current")
        -- Only delete first line if it matches the consumed file
        local f = io.open(queue_file, "r")
        if f then
            local first_line = f:read("*l")
            f:close()
            if first_line == fname then
                delete_first_line()
            end
        end
    end
end

-- Trigger when a file ends naturally
mp.register_event("end-file", function(event)
    if event.reason == "eof" then
        consume_current()
    end
end)

-- Keybindings for skip-and-delete
mp.add_key_binding(nil, "consume-next", function()
    consume_current()
    mp.commandv("playlist-next", "force")
end)

mp.add_forced_key_binding(">", "skip-and-delete", function()
    consume_current()
    mp.commandv("playlist-next", "force")
end)

-- Reload new entries from queue file without duplicates
local function reload_queue()
    local f = io.open(queue_file, "r")
    if not f then return end
    local lines = {}
    for line in f:lines() do
        table.insert(lines, line)
    end
    f:close()

    -- Build a set of current playlist filenames
    local current_playlist = {}
    for i = 0, mp.get_property_number("playlist-count", 0)-1 do
        local fname = mp.get_property("playlist/"..i.."/filename")
        current_playlist[fname] = true
    end

    -- Append only entries not already in playlist
    for _, entry in ipairs(lines) do
        if not current_playlist[entry] then
            mp.commandv("loadfile", entry, "append")
            msg.info("Appended to playlist: " .. entry)
        end
    end
end

-- Poll every second to check for new entries
mp.add_periodic_timer(1.0, reload_queue)

