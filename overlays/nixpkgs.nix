{inputs, ...}: {
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
    inputs.dolphin-overlay.overlays.default
  ];
}
