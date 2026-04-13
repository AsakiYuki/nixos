{ lib, ... }:
{
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
          type = lib.types.listOf lib.types.attrs;
          default = [];
          description = "Monitors settings";
        };
      };
    };
  };
}
