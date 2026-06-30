{libs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./network
    ./security
    ./services
    ./users
    ./boot

    (libs.root "/host/server")
  ];
}
