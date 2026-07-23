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
    ./security
    ./packages

    (libs.root "/host/desktop")
  ];
}
