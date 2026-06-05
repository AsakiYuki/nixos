{inputs, ...}: {
  nixpkgs.overlays = [
    inputs.dolphin-overlay.overlays.default
    inputs.millennium.overlays.default
  ];
}
