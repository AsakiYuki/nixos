{ ... }:
{
  wayland.windowManager.hyprland.settings.windowrule = [
    "opacity 0.0 override, class:^(xwaylandvideobridge)$"
    "noanim, class:^(xwaylandvideobridge)$"
    "noinitialfocus, class:^(xwaylandvideobridge)$"
    "maxsize 1 1, class:^(xwaylandvideobridge)$"
    "noblur, class:^(xwaylandvideobridge)$"
    "nofocus, class:^(xwaylandvideobridge)$"
  ];
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    "tile, class:^(Chromium)$"
  ];
}

