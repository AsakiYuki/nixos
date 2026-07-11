{libs, ...}: {
  imports = [
    ./hardware-configuration.nix
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
    # (libs.root "/users/hao1337/configuration.nix")
  ];
}
