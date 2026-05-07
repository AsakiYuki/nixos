{
  config,
  lib,
  ...
}: let
  cfg = config.programs.kde;
in {
  config.xdg.configFile.kdeglobals = lib.mkIf cfg.kdeglobals.enable {
    text =
      cfg.kdeglobals.initExtra
      + "\n"
      + (lib.generators.toINI {} config.programs.kde.kdeglobals.config);
  };
}
