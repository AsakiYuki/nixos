{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs.bash.iris;
  tomlFormat = pkgs.formats.toml {};
in {
  options.programs.bash.iris = with lib; {
    enable = mkEnableOption "IRIS";

    config = mkOption {
      type = tomlFormat.type;
      default = {};
    };

    package = mkOption {
      type = types.package;
      default = pkgs.iris;
    };
  };

  config = lib.mkIf cfg.enable {
    # programs.bash.initExtra = ''
    #   if [[ -z "$IRIS_SESSION" && $- == *i* ]]; then
    #     export IRIS_SESSION=1
    #     exec iris
    #   fi
    # '';

    programs.bash.shellAliases.i = "iris";

    home.packages = [cfg.package];
    home.file.".config/iris/config.toml" = lib.mkIf (cfg.config != {}) {
      source = tomlFormat.generate "iris-config.toml" cfg.config;
    };
  };
}
