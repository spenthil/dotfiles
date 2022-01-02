-----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"ctrl", "cmd"}
hs.window.animationDuration = 0
hs.window.setShadows(false)

require("hs.application")
require("hs.window")

-----------------------------------------------
-- grid
-----------------------------------------------
local grid = hs.grid
grid.setGrid('8x2')
grid.setMargins({0, 0})
hs.hotkey.bind(hyper, "return", grid.toggleShow)

-----------------------------------------------
-- window movement
-----------------------------------------------

function cols (num, width, offset)
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()
        f.x = max.x + max.w / num * offset
        --f.y = max.y
        f.w = max.w / num * width
        --f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end


function rows (num, height, offset)
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()
        --f.x = max.x
        f.y = max.y + max.h / num * offset
        --f.w = max.w
        f.h = max.h / num * height
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end

function switch ()
    -- get the focused window
    local win = hs.window.focusedWindow()
    -- get the screen where the focused window is displayed, a.k.a. current screen
    local screen = win:screen()
    -- compute the unitRect of the focused window relative to the current screen
    -- and move the window to the next screen setting the same unitRect 
    win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end

-----------------------------------------------
-- window hints
-----------------------------------------------

hs.hotkey.bind(hyper, '\'', function()
    hs.hints.windowHints()
end)

-----------------------------------------------
-- monitors
-----------------------------------------------
hs.hotkey.bind(hyper, '`', function()
    switch()
end)

-----------------------------------------------
-- window focus
-----------------------------------------------

hs.hotkey.bind(hyper, 'a', function()
    if hs.window.focusedWindow() then
        hs.window.filter.defaultCurrentSpace:focusWindowWest(nil, nil, true)
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'd', function()
    if hs.window.focusedWindow() then
        hs.window.filter.defaultCurrentSpace:focusWindowEast(nil, nil, true)
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'w', function()
    if hs.window.focusedWindow() then
        hs.window.filter.defaultCurrentSpace:focusWindowNorth(nil, nil, true)
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 's', function()
    if hs.window.focusedWindow() then
        hs.window.filter.defaultCurrentSpace:focusWindowSouth(nil, nil, true)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- reload config
-----------------------------------------------
function reload_config(files)
    hs.reload()
end
-- hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.hotkey.bind({"cmd", "ctrl"}, "r", reload_config)

hs.alert.show("Config loaded")
