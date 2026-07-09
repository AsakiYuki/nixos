{
  pkgs,
  lib,
  libs,
  config,
  ...
}: let
  cfg = config.virtualisation.waydroid;
in {
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

  programs.bash.interactiveShellInit = lib.mkIf cfg.enable (libs.readRootFile "/scripts/completions/waydroid.sh");
  environment.systemPackages = lib.optionals cfg.enable [pkgs.waydroid-helper];
}
