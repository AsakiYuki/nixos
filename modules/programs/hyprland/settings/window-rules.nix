{...}: {
  wayland.windowManager.hyprland.settings.windowrule = [
    "match:class ^clipse$, float on, size 622 652, suppress_event activatefocus"

    "match:class ^.*$, suppress_event maximize"
    "match:class ^$, match:title ^$, match:xwayland true, match:float true, match:fullscreen false, match:pin false, no_focus on"
    "match:class ^xwaylandvideobridge$, opacity 0 override, no_anim on, no_initial_focus on, max_size 1 1, no_blur on, no_focus on"
    "match:class ^Chromium$, tile on"
    "match:initial_class ^(wlroots|Waydroid)$, match:initial_title ^(wlroots - WL-1|Waydroid)$, fullscreen on, border_size 0"
  ];
}
