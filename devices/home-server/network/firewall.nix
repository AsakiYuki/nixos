{
  config,
  lib,
  ...
}: {
  networking.firewall = {
    enable = true;

    allowedUDPPorts = [
      53
    ];

    allowedTCPPorts = [
      15523 # SSH

      80
      443

      53 # DNS
      3306 # MySQL
      (lib.optional config.services.searx.enable config.services.searx.settings.port) # Searx
    ];
  };
}
