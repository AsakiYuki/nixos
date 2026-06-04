TouchpadName = "gxtp5100:00-27c6:01e0-touchpad"

-- monitors
hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x0",
    scale = 1,
    cm = "dcip3",
    -- cm = "hdredid",
    bitdepth = 10,
    supports_wide_color = true,
    supports_hdr = true,
    sdr_min_luminance = 0.0005,
    sdr_max_luminance = 200,
    min_luminance = 0,
    max_luminance = 500,
    max_avg_luminance = 400,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "1920x0",
    scale = 1,
})