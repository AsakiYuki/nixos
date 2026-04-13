{
  lib,
  libs,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./mount.nix

    ../../modules/features/system/upower.nix

    (libs.root "/host/desktop/default.nix")
    (libs.root "/home/asakiyuki/configuration.nix")
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Ho_Chi_Minh";

  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = [ "amd_pstate=active" ];
  boot.kernelModules = [ "ideapad_laptop" ];
  services.power-profiles-daemon.enable = true;
  environment.systemPackages = with pkgs; [
    lm_sensors
    ryzenadj
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [ pkgs.linuxPackages_latest.zenpower ];
  system.stateVersion = "25.11";
}
