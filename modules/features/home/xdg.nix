{ pkgs, lib, osconfig, ... }: {
    xdg.portal = lib.mkIf osconfig.device.wm.hyprland.enable {
        enable = true;
        xdgOpenUsePortal = true;
        config = {
            common.default = ["gtk"];
            hyprland.default = ["gtk" "hyprland"];
        };
        extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-hyprland
        ];
    };
}