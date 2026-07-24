{
  pkgs,
  lib,
  config,
  ...
}:
lib.mkIf config.programs.obs-studio.enable {
  home.file.".config/obs-studio/themes".source = "${pkgs.fetchzip {
    url = "https://static.asakiyuki.com/packages/nixos/catppuccin-obs.zip";
    sha256 = "sha256-Uk4a0HKaeyQilgBiPsuAWQubk1yZdyirNcfhYJEL+lQ=";
  }}/themes";
}
