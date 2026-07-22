{
  pkgs,
  libs,
  config,
  osconfig,
  ...
}: {
  programs.dolphin = {...}: {
    _module.args = {
      inherit osconfig libs pkgs;
      hmconfig = config;
    };

    imports = [
      ./services-menu
    ];
  };
}
