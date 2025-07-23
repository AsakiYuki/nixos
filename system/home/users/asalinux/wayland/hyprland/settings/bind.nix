{ ... }:
{ 
  bind = [
    # Programs
    "SUPER, F, exec, zen"
    "SUPER, Q, exec, kitty"
    "SUPER, E, exec, dolphin"
    "SUPER SHIFT, S, exec, hyprshot -m region -o '/home/asalinux/Pictures/Screenshot/' -z"    
 
    # Hyprland
    "SUPER, C, killactive"
    "SUPER, M, exit,"
    "SUPER SHIFT, TAB, togglefloating,"
    "SUPER, J, togglesplit,"

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

    # Quickshell
    "Alt, Space, global, asakiyuki:launcher"

    # Workspace
    "SUPER, 1, workspace, 1"
    "SUPER, 2, workspace, 2"
    "SUPER, 3, workspace, 3"
    "SUPER, 4, workspace, 4"
    "SUPER, F1, workspace, 5"
    "SUPER, F2, workspace, 6"
    "SUPER, F3, workspace, 7"
    "SUPER, F4, workspace, 8"
    "SUPER, code:49, workspace, 9"

    "SUPER SHIFT, 1, movetoworkspace, 1"
    "SUPER SHIFT, 2, movetoworkspace, 2"
    "SUPER SHIFT, 3, movetoworkspace, 3"
    "SUPER SHIFT, 4, movetoworkspace, 4"
    "SUPER SHIFT, F1, movetoworkspace, 5"
    "SUPER SHIFT, F2, movetoworkspace, 6"
    "SUPER SHIFT, F3, movetoworkspace, 7"
    "SUPER SHIFT, F4, movetoworkspace, 8"
    "SUPER SHIFT, code:49, movetoworkspace, 9"
  ];

  bindm = [
    "SUPER, mouse:272, movewindow"
    "SUPER, mouse:273, resizewindow"
  ];
}
