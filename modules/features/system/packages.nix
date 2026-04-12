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
      ntfs3g
      zip
      unzip

      wine
      wine64
      winetricks
      protontricks
      
      quickshell
      papirus-icon-theme
    ]
    ++ (
      with pkgs;
      with kdePackages;
      [
        kservice
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
