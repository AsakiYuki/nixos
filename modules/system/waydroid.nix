{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.virtualisation.waydroid;
in {
  virtualisation.waydroid = {
    package = pkgs.waydroid-nftables;
  };

  programs.bash.interactiveShellInit = lib.mkIf cfg.enable (lib.readRootFile "/scripts/shell/completions/waydroid.sh");
  environment.systemPackages = lib.optionals cfg.enable [pkgs.waydroid-helper];
}
