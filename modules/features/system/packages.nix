{
  pkgs,
  lib,
  config,
  ...
}:
let 
  custom-catppuccin-gtk = pkgs.catppuccin-gtk.override {
    variant = "mocha";
    accents = [ "sapphire" ];
    size = "compact";
  };

  custom-catppuccin-kde = (pkgs.catppuccin-kde.override {
    flavour = [ "mocha" ];
    accents = [ "sapphire" ];
  });
in 
{
  environment.systemPackages =
    with pkgs;
    [
      custom-catppuccin-gtk
      
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
      ntfs3g
      # wine64

      quickshell
      bluetuith
      lxqt.pavucontrol-qt
      nwg-look
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
