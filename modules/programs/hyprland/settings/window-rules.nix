{...}: {
  # wayland.windowManager.hyprland.settings.windowrule = [
  #   "match:class ^clipse$, float on, size 622 652, suppress_event activatefocus"

  #   "match:class ^.*$, suppress_event maximize"
  #   "match:class ^$, match:title ^$, match:xwayland true, match:float true, match:fullscreen false, match:pin false, no_focus on"
  #   "match:class ^xwaylandvideobridge$, opacity 0 override, no_anim on, no_initial_focus on, max_size 1 1, no_blur on, no_focus on"
  #   "match:class ^Chromium$, tile on"
  #   "match:initial_class ^(wlroots|Waydroid)$, match:initial_title ^(wlroots - WL-1|Waydroid)$, fullscreen on, border_size 0"
  # ];
  wayland.windowManager.hyprland.settings.windowrule = [
    "float, class:(clipse)"
    "size 622 652, class:(clipse)"
    "stayfocused, class:(clipse)"

    "suppressevent maximize, class:.*"
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

    "opacity 0.0 override, class:^(xwaylandvideobridge)$"
    "noanim, class:^(xwaylandvideobridge)$"
    "noinitialfocus, class:^(xwaylandvideobridge)$"
    "maxsize 1 1, class:^(xwaylandvideobridge)$"
    "noblur, class:^(xwaylandvideobridge)$"
    "nofocus, class:^(xwaylandvideobridge)$"
  ];
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    "tile, class:^(Chromium)$"
    "fullscreen, initialClass:^(wlroots|Waydroid)$, initialTitle:^(wlroots - WL-1|Waydroid)$"
    "noborder, initialClass:^(wlroots|Waydroid)$, initialTitle:^(wlroots - WL-1|Waydroid)$"
  ];
}
