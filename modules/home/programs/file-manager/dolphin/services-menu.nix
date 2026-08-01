{
  pkgs,
  lib,
  config,
  osconfig,
  ...
}: {
  programs.dolphin = {...}: {
    _module.args = {
      inherit osconfig lib pkgs;
      hmconfig = config;
    };

    imports = [
      ./services-menu
    ];
  };
}
