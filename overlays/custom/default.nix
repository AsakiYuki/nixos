{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      cage-xtmapper = pkgs.callPackage (import ./cage-xtmapper.nix) {};
    })
  ];
}
