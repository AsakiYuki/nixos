{ pkgs, ... }:
{
    services = {
        pipewire.enable = true;
        flatpak.enable = true;
        resolved.enable = true;

        xserver = {
            enable = true;
            displayManager = {
                sddm = {
                    enable = true;
                };
            };
        };

        cloudflare-warp = {
            enable = true;
        };
    };
}
