{ lib, config, ... }: {
    programs.steam = lib.mkIf config.device.programs.steam.enable {
        enable = true;
    };
}