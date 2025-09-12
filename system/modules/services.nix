{ pkgs, ... }:
{
    services = {
        xserver.enable = true;
        xserver.displayManager.sddm.enable = true;
        pipewire.enable = true;
        flatpak.enable = true;
        resolved.enable = true;
    };
}
