{ ... }:
{
    networking = {
        hostName = "nixos";
        wireless.enable = false;

        networkmanager = {
            enable = true;
            dns = "systemd-resolved";
        };
    };

    services.resolved = {
        enable = true;
        extraConfig = ''
            DNS=1.1.1.1 1.0.0.1
            FallbackDNS=8.8.8.8 8.8.4.4
            DNSStubListener=yes
        '';
    };
}
