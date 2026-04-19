{...}: {
  networking = {
    firewall = {
      enable = true;
      allowedUDPPorts = [
        53
        34778
      ];
      allowedTCPPorts = [
        80
        443
        18581
        8443
        15523
        37284
        53
        583
        25565
        21350
      ];
    };

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
