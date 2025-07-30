{ pkgs, ... }:
{
    services = {
        xserver.enable = true;
        pipewire.enable = true;
    };

    # virtualisation.docker.enable = true};
}