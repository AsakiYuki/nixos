{config, ...}: let
  cfg = config.programs.kde;
in {
  config.xdg.configFile.kdeglobals = cfg.kdeglobals.initExtra;
}
