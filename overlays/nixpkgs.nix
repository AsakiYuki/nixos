{
  inputs,
  config,
  lib,
  ...
}: {
  nixpkgs.overlays =
    (lib.optionals (!config.device.de.kdePlasma.enable) [
      inputs.dolphin-overlay.overlays.default
    ])
    ++ [
      inputs.millennium.overlays.default
    ];
}
