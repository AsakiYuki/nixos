{pkgs, ...}: {
  wayland.windowManager.hyprland.plugins = with pkgs.hyhyprlandPlugins; [
    hyprscrolling
  ];
}
