{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      tailcale = pkgs.callPackage (prev.tailscale.overrideAttrs (prevAtts: rec {})) {};
    })
  ];
}
