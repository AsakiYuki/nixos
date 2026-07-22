{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = lib.optionals config.programs.dconf.enable [
    pkgs.glib
  ];
}
