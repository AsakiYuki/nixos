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
  ];
}
