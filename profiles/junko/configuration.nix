{
  inputs,
  libs,
  config,
  custom,
  unstable,
  ...
}: let
  osconfig = config;
in {
  users.users.junko = {
    isNormalUser = true;
  };

  home-manager.users.junko = {
    _module.args = {
      inherit
        inputs
        unstable
        osconfig
        custom
        libs
        ;
    };

    imports = [];

    home = {
      username = "junko";
      stateVersion = "25.11";
    };
  };
}
