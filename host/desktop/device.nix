{inputs, ...}: {
  home-manager.users.asakiyuki.wayland.windowManager.hyprland.settings = {
    "$CURRENT_STATE_SCREEN" = "eDP-1, 1920x1200@60, 0x0, 1";
  };

  nix.settings = inputs.aagl.nixConfig;

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
      steam.enable = true;
    };
  };
}
