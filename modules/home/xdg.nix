{
  pkgs,
  lib,
  osconfig,
  ...
}: let
  hyprlandEnabled = osconfig.device.wm.hyprland.enable;
  kdePlasmaEnabled = osconfig.device.de.kdePlasma.enable;
in {
  xdg.portal = lib.mkIf (hyprlandEnabled || kdePlasmaEnabled) {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
    }
    // lib.optionalAttrs hyprlandEnabled {
      hyprland.default = ["gtk" "hyprland"];
    }
    // lib.optionalAttrs kdePlasmaEnabled {
      "plasma".default = ["kde" "gtk"];
    };
    extraPortals =
      [pkgs.xdg-desktop-portal-gtk]
      ++ lib.optionals hyprlandEnabled [pkgs.xdg-desktop-portal-hyprland]
      ++ lib.optionals kdePlasmaEnabled [pkgs.kdePackages.xdg-desktop-portal-kde];
  };
}
