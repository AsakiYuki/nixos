{...}: {
  wayland.windowManager.hyprland.settings = {
    bind = builtins.readFile ./bind.lua;
  };
}
