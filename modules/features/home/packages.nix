{
  pkgs,
  lib,
  osconfig,
  inputs,
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
  home.packages = with pkgs; [
    custom-catppuccin-gtk

    hyprshot
    antigravity
    prismlauncher
    protonup-qt
    protonplus
    vlc
    gimp
    libreoffice-qt-fresh
    lutris
    osu-lazer-bin
    lmstudio
    blender
    xprop

    bluetuith
    lxqt.pavucontrol-qt
    nwg-look

    proton-pass
    proton-authenticator

    inputs.hytale-launcher.packages.${pkgs.system}.default
    (lib.mkIf osconfig.device.programs.cider-2.enable cider-2)
  ];
}
