{
  pkgs,
  lib,
  libs,
  config,
  ...
}: let
  cfg = config.virtualisation.waydroid;
in
  lib.mergeAttrs {
    virtualisation.waydroid = {
      enable = true;
      package = pkgs.waydroid-nftables;
    };
  }
  (lib.optionalAttrs cfg.enable {
    programs.bash.interactiveShellInit = libs.readRootFile "/scripts/completions/waydroid.sh";
    environment.systemPackages = cfg.enable [
      pkgs.waydroid-helper
    ];
  })
