{
  osconfig,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind = builtins.concatLists [
      [
        "CTRL ALT, T, exec, ${osconfig.device.programs.terminal.name}"

        "SUPER SHIFT, L, exit,"
        "SUPER SHIFT, TAB, togglefloating,"
        "SUPER SHIFT, S, exec, hyprshot -m region -o '${config.home.homeDirectory}/Pictures/Screenshots/' -z"
        # "SUPER, J, layoutmsg, togglesplit"
        "SUPER, J, togglesplit,"
        "SUPER, E, exec, dolphin"

        "SUPER, C, killactive"

        "SUPER, TAB, workspace, e+1"
        "SUPER ALT, TAB, workspace, e-1"

        "SUPER, mouse_up, layoutmsg, focus r"
        "SUPER, mouse_down, layoutmsg, focus l"

        "SUPER SHIFT, mouse_up, layoutmsg, colresize +0.1"
        "SUPER SHIFT, mouse_down, layoutmsg, colresize -0.1"

        "SUPER, mouse:275, layoutmsg, movewindowto l"
        "SUPER, mouse:276, layoutmsg, movewindowto r"

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
      (
        builtins.concatLists (
          builtins.map (item: let
            at = builtins.elemAt item;
            key = at 0;
            keyShort = at 1;
            vimKey = at 2;
            vec2 = at 3;
          in [
            "SUPER CTRL, ${key}, layoutmsg, movewindowto ${keyShort}"
            "SUPER, ${key}, layoutmsg, focus ${keyShort}"
            "SUPER, ${vimKey}, layoutmsg, focus ${keyShort}"
            "SUPER CTRL, ${vimKey}, layoutmsg, movewindowto ${keyShort}"
            "SUPER SHIFT, ${key}, resizeactive, ${vec2}"
            "SUPER SHIFT, ${vimKey}, resizeactive, ${vec2}"
          ]) [
            ["LEFT" "l" "h" "-25 0"]
            ["RIGHT" "r" "l" "25 0"]
            ["UP" "u" "k" "0 -25"]
            ["DOWN" "d" "j" "0 25"]
          ]
        )
      )
      (
        builtins.concatLists (
          builtins.genList (i: [
            "SUPER, ${toString (i + 1)}, workspace,${toString (i + 1)}"
            "SUPER SHIFT, ${toString (i + 1)}, movetoworkspace,${toString (i + 1)}"
          ])
          9
        )
      )
      [
        "SUPER, 0, workspace, 10"
        "SUPER SHIFT, 0, movetoworkspace, 10"
      ]
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
