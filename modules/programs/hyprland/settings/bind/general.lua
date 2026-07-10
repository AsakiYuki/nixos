hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal))

hl.bind("SUPER + SHIFT + M", hl.dsp.exit())
hl.bind("SUPER + SHIFT + TAB", hl.dsp.window.float({ action = "toggle", }))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(("hyprshot -m region -o '" .. homeDir .. "/Pictures/Screenshots/' -z")))
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))

hl.bind("SUPER + C", hl.dsp.window.close())

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + ALT + TAB", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("ALT + SPACE", hl.dsp.global("asakiyuki:launcher"))
hl.bind("META + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind("Caps_Lock", hl.dsp.global("asakiyuki:capslock"), { ignore_mods = true })
hl.bind("XF86TouchpadToggle", hl.dsp.global("asakiyuki:touchpadtoggle"), { ignore_mods = true })