{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      tailscale = pkgs.callPackage (prev.tailscale.overrideAttrs (_: {
        vendorHash = "sha256-Sd2iLJ7eDfDYdIRuW4xuiKgzhQWJWGAnz97FJWrVRlE=";
      })) {};
    })
  ];
}
