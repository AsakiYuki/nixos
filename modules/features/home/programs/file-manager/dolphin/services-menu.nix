{
  libs,
  config,
  osconfig,
  ...
}: {
  programs.dolphin = {
    _module.args = {
      inherit osconfig libs;
      hmconfig = config;
    };

    imports = [
      ./services-menu
    ];
  };
}
