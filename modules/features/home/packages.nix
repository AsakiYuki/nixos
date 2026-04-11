{
  pkgs,
  lib,
  osconfig,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    hyprshot
    antigravity
    prismlauncher
    protonup-qt
    vlc
    gimp
    libreoffice-qt-fresh
    lutris
    osu-lazer-bin

    proton-pass
    proton-authenticator

    inputs.hytale-launcher.packages.${pkgs.system}.default
    (lib.mkIf osconfig.device.programs.cider-2.enable cider-2)
  ];
}
