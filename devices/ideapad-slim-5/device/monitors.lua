-- monitors
local isHDR = false

function updateHDR()
    hl.monitor({
        output = "eDP-1",
        mode = "1920x1200@60",
        position = "0x0",
        scale = 1,
        cm = isHDR and "hdr" or "dcip3",
        bitdepth = 10,
        supports_wide_color = true,
        supports_hdr = true,
        sdr_min_luminance = 0.0,
        min_luminance = 0.0,
        sdr_max_luminance = 150, 
        max_luminance = 500,
        max_avg_luminance = 300,
    })
end

function ToggleHDR()
    isHDR = not isHDR;
    updateHDR()
end

updateHDR()

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "1920x0",
    scale = 1,
})