{
  inputs,
  lib,
  ...
}: {
  nixpkgs.overlays =
    (lib.optional (inputs ? millennium) inputs.millennium.overlays.default)
    ++ [
      inputs.dolphin-overlay.overlays.default
    ];
}
