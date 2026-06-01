hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal))

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(("hyprshot -m region -o '%s/Pictures/Screenshots/' -z"):format(homeDir)))