{libs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./network
    ./security
    ./services
    ./boot

    (libs.root "/host/server")
  ];
}
