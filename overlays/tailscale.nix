{...}: {
  nixpkgs.overlays = [
    (final: prev: {
      tailscale = prev.tailscale.overrideAttrs (oldAttrs: {
        vendorHash = "sha256-Sd2iLJ7eDfDYdIRuW4xuiKgzhQWJWGAnz97FJWrVRlE=";
      });
    })
  ];
}
