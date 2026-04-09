{ lib, config, ... }: {
    programs.hyprland = lib.mkIf config.device.wm.hyprland.enable {
        enable = true;
    };
}