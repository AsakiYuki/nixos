hl.window_rule({
    match = { class = "(clipse)" },
    float = true,
    size = { 622, 652 },
    stay_focused = true,
})

hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    match = { class = "^(steam_app_\\d+)$" },
    tile = false,
})

hl.window_rule({
    match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false, },
    no_initial_focus = true,
})

hl.window_rule({
    match = { fullscreen = true, },
    border_size = 0,
    decorate = false,
    rounding = 0,
    rounding_power = 1,
})

hl.window_rule({
    match = { class = "^(xwaylandvideobridge)$" },
    opacity = 0,
    no_anim = 1,
    no_initial_focus = true,
    max_size = { 1, 1 },
    no_blur = true,
    no_focus = true,
})

hl.window_rule({
    match = { class = "^(Chromium)$" },
    tile = true,
})

hl.window_rule({
    match = { class = "^(wlroots|Waydroid)$", initial_title = "^(wlroots - WL-1|Waydroid)$" },
    fullscreen = true,
    border_size = 0,
})