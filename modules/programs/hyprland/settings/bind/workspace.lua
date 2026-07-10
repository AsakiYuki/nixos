hl.bind("SUPER + code:49", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + code:49", hl.dsp.window.move({ workspace = "special:magic" }))
for i = 1, 10 do
   local key = i % 10
   hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i}))
   hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end