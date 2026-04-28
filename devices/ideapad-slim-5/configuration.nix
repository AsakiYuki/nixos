{
  libs,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./mount.nix

    (libs.root "/host/desktop/default.nix")
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Ho_Chi_Minh";

  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = ["amd_pstate=active"];
  boot.kernelModules = ["ideapad_laptop"];
  services.power-profiles-daemon.enable = true;
  environment.systemPackages = with pkgs; [
    lm_sensors
    ryzenadj
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.asakiyuki.home = {
    sessionVariables = {
      QML_IMPORT_PATH = "/run/current-system/sw/lib/qt-6/qml";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = [config.boot.kernelPackages.zenpower];
  system.stateVersion = "25.11";
}
