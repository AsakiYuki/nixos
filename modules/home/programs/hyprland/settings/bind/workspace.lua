hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + ALT + TAB", hl.dsp.focus({ workspace = "e-1" }))

for i = 1, 12 do
   if (i < 11) then
      local key = i % 10
      hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
      hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
   end

   hl.bind("SUPER + F" .. i, hl.dsp.workspace.toggle_special(i))
   hl.bind("SUPER + SHIFT + F"..i, hl.dsp.window.move({ workspace = "special:"..i }))
end