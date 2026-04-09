{ osconfig, ... }:
{
  imports = [
    ./key-bind.nix
    ./theme.nix
    ./exec.nix
    ./window-rules.nix
    ./input.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = osconfig.device.wm.hyprland.monitors;
  };
}

