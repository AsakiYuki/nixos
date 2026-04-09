{ lib, config, ... }: {
    programs.niri.enable = lib.mkIf config.device.wm.niri.enable true;
    services.xserver.enable = lib.mkIf config.device.wm.niri.enable true;
}