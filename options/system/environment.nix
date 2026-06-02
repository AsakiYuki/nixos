{lib, ...}: {
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

    wm.hyprland = {
      enable = lib.mkEnableOption "hyprland";

      extraConfig = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "Extra Hyprland configuration to be appended to the generated config.";
      };
    };
  };
}
