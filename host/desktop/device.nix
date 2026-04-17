{pkgs, ...}: {
  home-manager.users.asakiyuki.wayland.windowManager.hyprland.settings = {
    "$SDR_SCREEN_CONFIG" = "eDP-1, 1920x1200@60, 0x0, 1";
    "$HDR_SCREEN_CONFIG" = "eDP-1, 1920x1200@60, 0x0, 1, bitdepth, 10, cm, hdr";
    "$CURRENT_STATE_SCREEN" = "$SDR_SCREEN_CONFIG";
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
    wm.hyprland.monitor = [
      "$CURRENT_STATE_SCREEN"
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
