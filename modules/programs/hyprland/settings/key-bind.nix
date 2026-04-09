{ osconfig, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
    "CTRL ALT, T, exec, ${osconfig.device.programs.terminal}"

    "ALT, F4, killactive"
    "SUPER SHIFT, L, exit,"
    "SUPER SHIFT, TAB, togglefloating,"
    "SUPER SHIFT, S, exec, hyprshot -m region -o '~/Pictures/Screenshot/' -z"
    "SUPER, J, togglesplit,"
    "SUPER, E, exec, dolphin"

    "SUPER, left, movefocus, l"
    "SUPER, right, movefocus, r"
    "SUPER, up, movefocus, u"
    "SUPER, down, movefocus, d"

    "SUPER CTRL, left, movewindow, l"
    "SUPER CTRL, right, movewindow, r"
    "SUPER CTRL, up, movewindow, u"
    "SUPER CTRL, down, movewindow, d"

    "SUPER, tab, workspace, e+1"
    "SUPER, mouse_down, workspace, e-1"
    "SUPER, mouse_up, workspace, e+1"

    "ALT, space, global, asakiyuki:launcher"

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
