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

hl.bind("SUPER + code:49", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + code:49", hl.dsp.window.move({ workspace = "special:magic" }))
for i = 1, 10 do
   local key = i % 10
   hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i}))
   hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

local function moveWindow(direction)
   local window = hl.get_active_window()
   if (window == nil) then return end

   if (window.floating) then
      
   else hl.dispatch(hl.dsp.window.move({ direction = direction })) end
end

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER  + SHIFT + left", function () moveWindow("left") end)
hl.bind("SUPER  + SHIFT + right", function () moveWindow("right") end)
hl.bind("SUPER  + SHIFT + up", function () moveWindow("up") end)
hl.bind("SUPER  + SHIFT + down", function () moveWindow("down") end)

hl.bind("SUPER + mouse_down", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + mouse:275", function () moveWindow("left") end)
hl.bind("SUPER + mouse:276", function () moveWindow("right") end)

hl.bind("Caps_Lock", hl.dsp.global("asakiyuki:capslock"), { ignore_mods = true })
hl.bind("XF86TouchpadToggle", hl.dsp.global("asakiyuki:touchpadtoggle"), { ignore_mods = true })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + D", function ()
   local window = hl.get_active_window()
   if (window == nil or not window.floating) then return end
   
   local monitor = window.monitor;
   if (monitor == nil) then return end

   hl.dispatch(
      hl.dsp.window.move({
         x = monitor.size.width / 2 - window.size.x / 2,
         y = ((monitor.size.height - 50) / 2 - window.size.y / 2) + 50,
      })
   )
end)