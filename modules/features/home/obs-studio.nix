{ pkgs, custom, lib, osconfig,  ... }:
lib.mkIf osconfig.device.programs.obs-studio.enable {
    programs.obs-studio.enable = true;
    home.file.".config/obs-studio/themes".source = pkgs.callPackage custom.catppuccin-obs { };
}