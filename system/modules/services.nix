{ pkgs, ... }:
{
    services = {
        xserver.enable = true;
        pipewire.enable = true;
        flatpak.enable = true;
    };

    # virtualisation.docker.enable = true};
}