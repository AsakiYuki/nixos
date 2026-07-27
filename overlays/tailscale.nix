{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      tailcale = pkgs.callPackage (prev.tailscale.overrideAttrs (_: {
        vendorHash = "sha256-Sd2iLJ7eDfDYdIRuW4xuiKgzhQWJWGAnz97FJWrVRlE=";
      })) {};
    })
  ];
}
