-- monitors
local isHDR = false

local function updateMonitor()
    hl.monitor({
        output = "eDP-1",
        mode = "1920x1200@60",
        position = "0x0",
        scale = 1,
        cm = isHDR and "hdr" or "dcip3",
        sdr_eotf = "default",
        bitdepth = 10,
        -- supports_wide_color = true,
        supports_hdr = isHDR and 1 or 0,
        sdr_min_luminance = 0.0,
        min_luminance = -1,
        sdr_max_luminance = 200, 
        max_luminance = 500,
        -- max_luminance = -1,
        -- max_avg_luminance = -1,
        max_avg_luminance = 300,
    })
end

function ToggleHDR()
    isHDR = not isHDR;
    updateMonitor()
end

updateMonitor()

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "1920x0",
    scale = 1,
})