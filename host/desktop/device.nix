{
  lib,
  pkgs,
  ...
}: let
  ENABLE_HDR = false;
in {
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
      (
        {
          output = "eDP-1";
          mode = "1920x1200@60";
          position = "0x0";
          scale = 1;
        }
        // lib.optionalAttrs ENABLE_HDR {
          bitdepth = 10;
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
        }
      )
    ];

    bluetooth.enable = true;
    flatpak.enable = true;

    files = {
      force = {};

      mkForce = {
        ".mozilla/firefox/default/search.json.mozlz4" = true;
      };

      source = {
        ".config/qt5ct/colors/Catppuccin-Mocha.conf" = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/catppuccin-mocha-sapphire.conf";
        ".config/qt6ct/colors/Catppuccin-Mocha.conf" = "${pkgs.catppuccin-qt5ct}/share/qt6ct/colors/catppuccin-mocha-sapphire.conf";
      };

      symlink = {
        "SteamApps" = ".local/share/Steam/steamapps";
        "Development/Quickshell" = ".config/quickshell";
        # "Development/KDE-Widget" = ".local/share/plasma/plasmoids";
        # "Development/SplashScreen" = ".local/share/plasma/look-and-feel";
        # "Development/DesktopEffects" = ".local/share/kwin/effects";
      };
    };

    programs = {
      terminal = {
        enable = true;
        name = "ghostty";
      };
      obs-studio.enable = true;
      nixcord.enable = true;
      tmux.enable = true;
      starship.enable = true;
      fastfetch.enable = true;
      cider-2.enable = true;
      steam.enable = true;
    };
  };
}
