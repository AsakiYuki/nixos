{
  pkgs,
  lib,
  osconfig,
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

    (lib.mkIf osconfig.device.programs.cider-2.enable cider-2)
  ];
}
