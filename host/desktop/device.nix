{...}: {
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
