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
    ./programs

    (libs.root "/host/desktop")
  ];
}
