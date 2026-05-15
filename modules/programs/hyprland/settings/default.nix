{osconfig, ...}: {
  imports = [
    ./key-bind.nix
    ./theme.nix
    ./exec.nix
    ./window-rules.nix
    ./input.nix
    ./plugins.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitorv2 = osconfig.device.wm.hyprland.monitorsv2;
    monitor = osconfig.device.wm.hyprland.monitor;
  };
}
