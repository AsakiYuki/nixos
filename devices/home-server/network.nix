{...}: {
  networking = {
    hostName = "nixos";

    firewall.enable = true;
    firewall.allowedUDPPorts = [
      53

      # 19132 # MCBE
      # 19133
    ];
    firewall.allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS

      53 # DNS
      3306 # MySQL

      15523 # SSH
    ];

    useDHCP = false;
    networkmanager.enable = true;

    defaultGateway = "192.168.1.1";
    nameservers = [
      "8.8.8.8"
      "1.1.1.1"
    ];

    interfaces = {
      enp1s0 = {
        useDHCP = false;
        ipv4.addresses = [
          {
            address = "192.168.1.100";
            prefixLength = 24;
          }
        ];

        ipv6.addresses = [
          {
            address = "2402:800:62d0:1c26:abcd:1234:5678:9abc";
            prefixLength = 64;
          }
        ];
      };
    };
  };
}
