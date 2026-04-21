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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEQMWoMdcMNT4ceERAWWVcI7kS6x42Z8BjyYyvJ+rh/B vantrong2007vn@gmail.com"
    ];
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
