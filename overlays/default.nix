{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  iris-overlays = final: prev: {iris = inputs.iris.packages.${pkgs.stdenv.hostPlatform.system}.default;};
in {
  nixpkgs.overlays =
    [
      inputs.asa-overlay.overlays.default
      inputs.millennium.overlays.default
      iris-overlays
    ]
    ++ (lib.optional (!config.device.de.kdePlasma.enable) [inputs.dolphin-overlay.overlays.default]);
}
