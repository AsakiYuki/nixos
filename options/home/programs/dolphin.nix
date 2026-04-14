{
  lib,
  pkgs,
  ...
}: {
  options.programs = {
    dolphin = {
      enable = lib.mkEnableOption "dolphin";
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.kdePackages.dolphin;
      };
    };
  };
}
