hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 1,
        allow_tearing = true,
        resize_on_border = true,
        col = {
            active_border = "rgb(cdd6f4)",
            inactive_border = "rgb(7f849c)",
        },
    },

    decoration = {
        rounding = 13,
        rounding_power = 10,
        active_opacity = 1,
        inactive_opacity = 1,

        blur = {
            enabled = true,
            size = 2,
            passes = 5,
            vibrancy = 3,
        },
    },

    animations = { enabled = true, },
    dwindle = { preserve_split = true, },
    master = { new_status = "master", },

    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo = true,
    },
})

-- easing
hl.curve("overshot", { type = "bezier", points = {{0.05, 0.9}, {0.1, 1.1}}})
hl.curve("md3_decel", { type = "bezier", points = {{0.05, 0.7}, {0.1, 1}}})

-- animations
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "overshot", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "overshot", style = "slidefade 15%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.5, bezier = "md3_decel", style = "slidevert" })