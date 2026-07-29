{
  lib,
  inputs,
  pkgs,
  config,
  ...
}: {
  options.programs.bash.iris = {
    enable = lib.mkEnableOption "IRIS";
    package = lib.mkOption {
      type = lib.types.package;
      default = inputs.iris.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };

  config = let
    cfg = config.programs.bash.iris;
  in
    lib.mkIf cfg.enable {
      programs.bash.initExtra = "iris";
      home.packages = [cfg.package];
    };
}
