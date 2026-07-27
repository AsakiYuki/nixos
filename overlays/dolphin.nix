{
  lib,
  config,
  inputs,
  ...
}: {
  nixpkgs.overlays = lib.mkIf (!config.device.de.kdePlasma.enable) [
    inputs.dolphin-overlay.overlays.default
  ];
}
