{inputs, ...}: {
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
    inputs.niri.overlays.niri
    inputs.dolphin-overlay.overlays.default
  ];
}
