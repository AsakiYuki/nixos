{libs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./chaotic.nix

    ./hardware
    ./systemd
    ./mount
    ./network
    ./boot
    ./environment
    ./device
    ./services
    ./packages

    (libs.root "/host/desktop")
  ];
}
