{
  inputs,
  lib,
  config,
  ...
}: {
  options.device.wm.niri.enable = lib.mkEnableOption "niri";

  programs.niri.enable = lib.mkIf config.device.wm.niri.enable true;
  services.xserver.enable = lib.mkIf config.device.wm.niri.enable true;

  nixpkgs.overlays = [inputs.niri.overlays.niri];
}
