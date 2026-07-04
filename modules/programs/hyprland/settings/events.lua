hl.on("window.open",
    ---@param window HL.Window
    function (window)
        local monitor = window.monitor
        if (monitor == nil) then return end
        if (window.fullscreen or window.over_fullscreen) then return end
        if (window.size.x == monitor.size.width and window.size.y == monitor.size.height) then
            hl.dsp.window.fullscreen({
                mode = "fullscreen",
                action = "set",
                window = window,
            })
        end
    end
)