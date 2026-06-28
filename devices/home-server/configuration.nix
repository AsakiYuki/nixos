{libs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./network.nix
    ./boot.nix
    (libs.root "/host/server")
  ];
}
