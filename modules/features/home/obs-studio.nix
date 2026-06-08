{
  pkgs,
  custom,
  lib,
  config,
  ...
}:
lib.mkIf config.programs.obs-studio.enable {
  home.file.".config/obs-studio/themes".source = pkgs.callPackage custom.catppuccin-obs {};
}
