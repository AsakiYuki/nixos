{config, ...}: let
  cfg = config.programs.kde;
in {
  config.xdg.configFile.kdeglobals.text = cfg.kdeglobals.initExtra;
}
