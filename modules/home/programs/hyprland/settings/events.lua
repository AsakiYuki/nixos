---@param window HL.Window
local function setFullscreen (window)
    local monitor = window.monitor
    if (monitor == nil) then return end
    if (window.fullscreen == 2) then return end
    if (window.size.x == monitor.size.width and window.size.y == monitor.size.height) then

        hl.dispatch(hl.dsp.window.fullscreen({
            mode = "fullscreen",
            action = "set",
            window = window,
        }))
    end
end

hl.on("window.active", setFullscreen)