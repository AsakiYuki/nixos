hl.device({
    name = "gxtp5100:00-27c6:01e0-touchpad",
    enabled = false,
})

hl.config({
    input = {
        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
        },
        accel_profile = "flat",
        sensitivity = 1.0,
    },
})
