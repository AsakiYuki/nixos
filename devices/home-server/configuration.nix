{libs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./network
    ./programs
    ./security
    ./services
    ./systemd
    ./users
    ./boot

    (libs.root "/host/server")
    (libs.root "/users/junko/configuration.nix")
    (libs.root "/users/hieze/configuration.nix")
  ];

  services.openssh.settings.X11Forwarding = true;
}
