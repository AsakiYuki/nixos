{ osconfig, lib, ... }: {
    programs.niri = lib.mkIf osconfig.device.wm.niri.enable {
        enable = true;
        settings = {
            binds = {
                # "Ctrl+Alt+T" = "ghostty";
                # "Mod+D" = "fuzzel";
            };
        };
    };
}