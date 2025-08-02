{ ... }:
{
    networking = {
        hostName = "nixos";
        wireless.enable = false;

        networkmanager = {
            enable = true;
            dns = "systemd-resolved";
            insertNameservers = [
                "1.1.1.1"
                "1.0.0.1"
            ];
        };

        hosts = {};
    };
}