{ ... }:
{
  home-manager.users.asakiyuki.wayland.windowManager.hyprland.settings = {
    # "$SCREEN_HDR_STATE" = "srgb";
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
    wm.hyprland.monitorsv2 = [
      {
        output = "eDP-1";
        mode = "1920x1200@60";
        position = "0x0";
        scale = 1;
        # cm = "$SCREEN_HDR_STATE";
        # bitdepth = 10;
        # supports_wide_color = 1;
        # supports_hdr = 1;
        # sdr_min_luminance = 0.0005;
        # sdr_max_luminance = 200;
        # min_luminance = 0;
        # max_luminance = 500;
        # max_avg_luminance = 400;
      }
      {
        output = "HDMI-A-1";
        mode = "1920x1080@60";
        position = "1920x0";
        scale = 1;
        # mirror = "eDP-1";
      }
    ];

    bluetooth.enable = true;
    flatpak.enable = true;

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
    };
  };
}
