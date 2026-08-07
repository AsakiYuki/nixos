{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  iris-overlays = final: prev: {
    iris = inputs.iris.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (final: prev: {
      vendorHash = "sha256-q1szUQkhdKq2VhMuWYYWTahmDxGeVjvHLmjciZu3cBU=";
    });
  };
in {
  nixpkgs.overlays =
    [
      inputs.overlays.overlays.default
      inputs.millennium.overlays.default
      iris-overlays
    ]
    ++ (lib.optional (!config.device.de.kdePlasma.enable) inputs.dolphin-overlay.overlays.default);
}
