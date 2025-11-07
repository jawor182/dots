-- Configuration
local queue_file = os.getenv("HOME") .. "/.local/share/mpvq/playlist.m3u"
local current_file = nil

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
    local f = io.open(queue_file, "w")
    if not f then
        return false
    end
    for _, line in ipairs(lines) do
        f:write(line, "\n")
    end
    f:close()
    return true
end

local function normalize_path_for_comparison(line)
    if line:match("^file://") then
        return line:sub(8) -- remove 'file://'
    else
        return line
    end
end


-- Function to remove the currently playing file from the queue file
local function remove_current_from_queue()
    if not current_file then return end
    local lines = read_queue_file()
    local new_lines = {}
    local removed = false
    for _, line in ipairs(lines) do
        if normalize_path_for_comparison(line) == current_file and not removed then
            removed = true
            mp.msg.info("Removed from queue: " .. line)
        else
            table.insert(new_lines, line)
        end
    end
    if removed then
        write_queue_file(new_lines)
    end
end

-- Event handlers
mp.register_event("file-loaded", function()
    current_file = mp.get_property("path")
    mp.msg.info("Now playing: " .. (current_file or "unknown"))
end)

mp.register_event("end-file", function(event)
    -- Only remove from queue if playback ended normally
    if event.reason == "eof" then
        remove_current_from_queue()
    else
        mp.msg.warn("File ended unexpectedly (" .. tostring(event.reason) .. "): " .. (current_file or "unknown"))
    end
    current_file = nil
end)

