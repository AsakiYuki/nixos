{inputs, ...}: {
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    inputs.dolphin-overlay.overlays.default
  ];
}
