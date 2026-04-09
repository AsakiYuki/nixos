{ lib, config, ... }: {
    services = lib.mkIf config.device.de.gnome.enable {
        desktopManager.gnome.enable = true;
    };
}