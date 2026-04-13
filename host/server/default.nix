{ libs, pkgs, ... }:
{
  imports = [
    (libs.root "/home/asakiyuki/configuration.nix")
    (libs.root "/options/server/default.nix")
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  users.users.junko = {
    isNormalUser = true;
  };

  users.users.asakiyuki = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  services = {
    adguardhome = {
      enable = true;
      port = 34778;
      openFirewall = true;
    };

    fail2ban = {
      enable = true;
      ignoreIP = [
        "192.168.0.0/16"
      ];
    };

    cloudflare-dyndns = {
      enable = true;
      apiTokenFile = "/home/asakiyuki/.secret/CLOUDFLARE_TOKEN_KEY";
      frequency = "*:0/5";
      proxied = true;
      ipv6 = false;
      ipv4 = true;
      deleteMissing = false;
      domains = [ "ddns.asakiyuki.com" ];
    };

    openssh = {
      enable = true;
      ports = [ 15523 ];
      authorizedKeysInHomedir = true;
      authorizedKeysFiles = [ "/home/asakiyuki/.ssh/authorized_keys" ];
      settings = {
        AllowUsers = [
          "asakiyuki"
          "junko"
        ];
        PasswordAuthentication = true;
        KbdInteractiveAuthentication = false;
        AllowAgentForwarding = false;
        AllowStreamLocalForwarding = false;
        X11Forwarding = false;
        PermitRootLogin = "no";
      };
    };
  };

  networking = {
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

    firewall = {
      enable = true;
      allowedUDPPorts = [
        53
        34778
      ];
      allowedTCPPorts = [
        15523
        53
        8443
        583
        25565
      ];
    };
  };
}
