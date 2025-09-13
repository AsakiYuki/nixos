{ pkgs, ... }:
{
    services = {
        pipewire.enable = true;
        flatpak.enable = true;
        resolved.enable = true;
        displayManager.sddm = {
            enable = true;
            wayland.enable = true;
        };
    };
}
