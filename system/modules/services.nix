{ pkgs, ... }:
{
    services = {
        xserver.enable = true;
        pipewire.enable = true;
    };
}