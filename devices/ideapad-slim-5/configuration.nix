{
  lib,
  libs,
  pkgs,
  ...
}:
let
  ENABLE_HDR = false;
in 
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

  environment.sessionVariables = {
    PROTON_USE_WAYLAND = "1";
    PROTON_USE_NTSYNC = "1";
  };

  device = {
    flake-name = "ideapad-slim-5";
    cursors = "aemeath";

    dm.sddm.enable = true;
    dm.gdm.enable = false;

    de.kdePlasma.enable = false;
    de.gnome.enable = false;

    wm.niri.enable = false;
    wm.hyprland.enable = true;
    wm.hyprland.monitors = [
      ({
        output = "eDP-1";
        mode = "1920x1200@60";
        position = "0x0";
        scale = 1;

        bitdepth = 10;
      } // lib.optionalAttrs ENABLE_HDR {
        cm = "hdr";
        supports_wide_color = 1;
        supports_hdr = 1;

        sdrbrightness = 1.0;
        sdrsaturation = 1.0;

        sdr_min_luminance = 0.005;
        sdr_max_luminance = 200;

        min_luminance = 0.0005;
        max_luminance = 400;
        max_avg_luminance = 250;

        sdr_eotf = 2;
      })
    ];

    bluetooth.enable = true;
    flatpak.enable = true;

    symlink = {
      "SteamApps" = ".local/share/Steam/steamapps";
      # "Development/KDE-Widget" = ".local/share/plasma/plasmoids";
      # "Development/SplashScreen" = ".local/share/plasma/look-and-feel";
      # "Development/DesktopEffects" = ".local/share/kwin/effects";
    };

    programs = {
      terminal = "ghostty";
      obs-studio.enable = true;
      nixcord.enable = true;
      tmux.enable = true;
      starship.enable = true;
      fastfetch.enable = true;
      cider-2.enable = true;
      steam.enable = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [ pkgs.linuxPackages_latest.zenpower ];
  system.stateVersion = "25.11";
}
