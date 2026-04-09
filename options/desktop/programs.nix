{ lib, ... }: {
    options.device.programs = {
        terminal = lib.mkOption {
            type = lib.types.str;
            default = "ghostty";
            description = "Terminal";
        };

        nixcord.enable = lib.mkEnableOption "nixcord";
        tmux.enable = lib.mkEnableOption "tmux";
        starship.enable = lib.mkEnableOption "starship";
        fastfetch.enable = lib.mkEnableOption "fastfetch";
        steam.enable = lib.mkEnableOption "steam";
        
        obs-studio.enable = lib.mkEnableOption "Obs Studio";
        cider-2.enable = lib.mkEnableOption "Cider 2";
    };
}