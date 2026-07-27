{inputs, ...}: {
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
  ];
}
