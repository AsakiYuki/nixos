{ pkgs, ... }:
{
    services = {
        xserver.enable = true;
        pipewire.enable = true;
        flatpak.enable = true;
        resolved.enable = true;
    };
}