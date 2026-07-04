{...}: {
  networking.firewall = {
    enable = false;

    allowedUDPPorts = [
      53
    ];

    allowedTCPPorts = [
      15523 # SSH

      80
      443

      53 # DNS
      3306 # MySQL
    ];
  };
}
