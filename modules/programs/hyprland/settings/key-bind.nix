{
  osconfig,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        "CTRL ALT, T, exec, ${osconfig.device.programs.terminal.name}"

        "SUPER SHIFT, L, exit,"
        "SUPER SHIFT, TAB, togglefloating,"
        "SUPER SHIFT, S, exec, hyprshot -m region -o '${config.home.homeDirectory}/Pictures/Screenshots/' -z"
        "SUPER, J, layoutmsg, togglesplit"
        "SUPER, E, exec, dolphin"

        "SUPER, C, killactive"

        "SUPER, TAB, workspace, e+1"
        "SUPER ALT, TAB, workspace, e-1"
        "SUPER, MOUSE_DOWN, workspace, e-1"
        "SUPER, MOUSE_UP, workspace, e+1"

        ", XF86TouchpadToggle, global, asakiyuki:touchpadtoggle"
        "SUPER ALT, B, global, asakiyuki:hdrtoggle"
        "ALT, SPACE, global, asakiyuki:launcher"

        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
      ]
      ++ builtins.concatLists (
        builtins.map (item: let
          at = builtins.elemAt item;
          key = at 0;
          keyShort = at 1;
          vimKey = at 2;
          vec3 = at 3;
        in [
          "SUPER CTRL, ${key}, movewindow, ${keyShort}"
          "SUPER, ${key}, movefocus, ${keyShort}"
          "SUPER, ${vimKey}, movefocus, ${keyShort}"
          "SUPER CTRL, ${vimKey}, movewindow, ${keyShort}"
          "SUPER SHIFT, ${key}, resizeactive, ${vec3}"
          "SUPER SHIFT, ${vimKey}, resizeactive, ${vec3}"
        ]) [
          ["LEFT" "l" "h" "-25 0"]
          ["RIGHT" "r" "l" "25 0"]
          ["UP" "u" "k" "0 -25"]
          ["DOWN" "d" "j" "0 25"]
        ]
      )
      ++ builtins.concatLists (
        builtins.genList (i: [
          "SUPER, ${toString (i + 1)}, workspace,${toString (i + 1)}"
          "SUPER SHIFT, ${toString (i + 1)}, movetoworkspace,${toString (i + 1)}"
        ])
        9
      )
      ++ [
        "SUPER, 0, workspace, 10"
        "SUPER SHIFT, 0, movetoworkspace, 10"
      ];

    bindi = [
      ", Caps_Lock, global, asakiyuki:capslock"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
