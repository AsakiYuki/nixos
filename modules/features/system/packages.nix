{
  pkgs,
  lib,
  config,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      git
      vim
      wget
      tree
      btop
      ffmpeg-full
      nodejs
      bun
      brightnessctl
      php
      # wine64

      quickshell
      bluetuith
      lxqt.pavucontrol-qt
      nwg-look

      # (pkgs.catppuccin-kde.override {
      #   flavour = [ "mocha" ];
      #   accents = [ "sapphire" ];
      # })

      (pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "sapphire" ];
        size = "compact";
      })
    ]
    ++ (
      with pkgs;
      with kdePackages;
      [
        dolphin
        kate
        qt5compat
        qtdeclarative
        qtimageformats
        qtsvg
        qtmultimedia
        kde-gtk-config
        qtdeclarative
        kirigami
        ksvg
        qtbase
        plasma5support
        qttools
        plasma-sdk
      ]
    )
    ++ (lib.optionals config.device.wm.hyprland.enable (
      with pkgs;
      [
        xdg-desktop-portal
        xdg-desktop-portal-wlr
        xdg-desktop-portal-hyprland
      ]
    ));
}
