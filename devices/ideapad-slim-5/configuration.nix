{
  libs,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./systemd.nix
    ./mount.nix
    ./network.nix
    ./boot.nix
    ./environment.nix

    (libs.root "/host/desktop/default.nix")
  ];

  services = {
    power-profiles-daemon.enable = true;
    xserver.videoDrivers = [ "amdgpu" ];
  };

  environment.systemPackages = with pkgs; [
    # php btw
    php85
    php85Packages.composer
    intelephense

    lm_sensors
    ryzenadj
    sbctl
    rsync
  ];

  device.wm.hyprland.extraConfig = builtins.readFile ./hyprland.lua;
}
