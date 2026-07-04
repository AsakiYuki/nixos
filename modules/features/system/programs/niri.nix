{
  inputs,
  lib,
  config,
  ...
}: {
  options.device.wm.niri.enable = lib.mkEnableOption "niri";

  config = lib.mkIf config.device.wm.niri.enable {
    programs.niri.enable = true;
    services.xserver.enable = true;
    nixpkgs.overlays = [inputs.niri.overlays.niri];
  };
}
