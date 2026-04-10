{ osconfig, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
    "CTRL ALT, T, exec, ${osconfig.device.programs.terminal}"

    "SUPER SHIFT, L, exit,"
    "SUPER SHIFT, TAB, togglefloating,"
    "SUPER SHIFT, S, exec, hyprshot -m region -o '/home/asakiyuki/Pictures/Screenshots/' -z"
    "SUPER, J, togglesplit,"
    "SUPER, E, exec, dolphin"

    "SUPER, C, killactive"

    "SUPER SHIFT, LEFT, resizeactive, -25 0"
    "SUPER SHIFT, RIGHT, resizeactive, 25 0"
    "SUPER SHIFT, UP, resizeactive, 0 -25"
    "SUPER SHIFT, DOWN, resizeactive, 0 25"

    "SUPER, LEFT, movefocus, l"
    "SUPER, RIGHT, movefocus, r"
    "SUPER, UP, movefocus, u"
    "SUPER, DOWN, movefocus, d"

    "SUPER CTRL, LEFT, movewindow, l"
    "SUPER CTRL, RIGHT, movewindow, r"
    "SUPER CTRL, UP, movewindow, u"
    "SUPER CTRL, DOWN, movewindow, d"
    
    "SUPER SHIFT, h, resizeactive, -25 0"
    "SUPER SHIFT, l, resizeactive, 25 0"
    "SUPER SHIFT, k, resizeactive, 0 -25"
    "SUPER SHIFT, j, resizeactive, 0 25"

    "SUPER, h, movefocus, l"
    "SUPER, l, movefocus, r"
    "SUPER, k, movefocus, u"
    "SUPER, j, movefocus, d"

    "SUPER CTRL, h, movewindow, l"
    "SUPER CTRL, l, movewindow, r"
    "SUPER CTRL, k, movewindow, u"
    "SUPER CTRL, j, movewindow, d"

    "SUPER, TAB, workspace, e+1"
    "SUPER ALT, TAB, workspace, e-1"
    "SUPER, MOUSE_DOWN, workspace, e-1"
    "SUPER, MOUSE_UP, workspace, e+1"

    "ALT, SPACE, global, asakiyuki:launcher"

    ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
  ]
  ++ builtins.concatLists (
    builtins.genList (i: [
      "SUPER, ${toString (i + 1)}, workspace,${toString (i + 1)}"
      "SUPER SHIFT, ${toString (i + 1)}, movetoworkspace,${toString (i + 1)}"
    ]) 9
  )
  ++ [
    "SUPER, 0, workspace, 10"
    "SUPER SHIFT, 0, movetoworkspace, 10"
  ];

  wayland.windowManager.hyprland.settings.bindm = [
    "SUPER, mouse:272, movewindow"
    "SUPER, mouse:273, resizewindow"
  ];
}
