{
  lib,
  osconfig,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./lua/default.nix
  ];

  wayland.windowManager.hyprland = lib.mkIf osconfig.device.wm.hyprland.enable {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };
}
