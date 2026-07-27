{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      cage-xtmapper = pkgs.callPackage (import ./cage-xtmapper.nix) {};
      cider-2 = pkgs.callPackage (import ./cider-2.nix) {};
      bun-baseline = pkgs.callPackage (import ./bun-baseline.nix) {};
      geode-cli = pkgs.callPackage (import ./geode-cli.nix) {};
    })
  ];
}
