local function moveWindow(direction)
   local window = hl.get_active_window()
   if (window == nil) then return end

   if (window.floating) then
      
   else hl.dispatch(hl.dsp.window.move({ direction = direction })) end
end

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


hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })