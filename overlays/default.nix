{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  overlays = final: prev: {
    zen-browser = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
    iris = inputs.iris.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (final: prev: {
      vendorHash = "sha256-q1szUQkhdKq2VhMuWYYWTahmDxGeVjvHLmjciZu3cBU=";
    });
  };
in {
  nixpkgs.overlays =
    lib.flatten [
      overlays
      inputs.overlays.overlays.default
      inputs.millennium.overlays.default
    ]
    ++ (lib.optional (!config.device.de.kdePlasma.enable) inputs.dolphin-overlay.overlays.default);
}
