{ lib, ... }: {
    options.device = {
        dm = {
            sddm = {
                enable = lib.mkEnableOption "sddm";
                theme = lib.mkOption {
                    type = lib.types.str;
                    default = "hyprland_kath";
                    description = "astronaut theme name";
                };
            };

            gdm.enable = lib.mkEnableOption "gdm";
        };

        de = {
            kdePlasma.enable = lib.mkEnableOption "kde plasma";
            gnome.enable = lib.mkEnableOption "gnome";
        };

        wm = {
            niri.enable = lib.mkEnableOption "niri";
            hyprland = {
                enable = lib.mkEnableOption "hyprland";
                monitors = lib.mkOption {
                    type = lib.types.listOf lib.types.str;
                    default = [ "eDP-1, 1920x1200@60, 0x0, 1" ];
                    description = "Monitors settings";
                };
            };
        };
    };
}