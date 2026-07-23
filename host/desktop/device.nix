{...}: {
  home-manager.users.asakiyuki.wayland.windowManager.hyprland.settings = {
    # "$SCREEN_HDR_STATE" = "srgb";
  };

  device = {
    dm.sddm.enable = true;
    dm.gdm.enable = false;

    de.kdePlasma.enable = true;
    de.gnome.enable = false;

    wm.niri.enable = false;
    wm.hyprland.enable = true;

    flatpak.enable = true;
  };
}
