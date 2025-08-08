{ ... }:
{
    networking = {
        hostName = "nixos";
        wireless.enable = false;

        networkmanager.enable = true;
    };
}
