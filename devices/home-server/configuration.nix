{libs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./network
    ./boot
    (libs.root "/host/server")
  ];
}
