{libs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./network
    ./security
    ./services
    ./systemd
    ./users
    ./boot

    (libs.root "/host/server")
    (libs.root "/users/junko/configuration.nix")
    (libs.root "/users/hieze/configuration.nix")
  ];
}
