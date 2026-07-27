{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      cage-xtmapper = pkgs.callPackage (import ./cage-xtmapper.nix) {};
      cider-2 = pkgs.callPackage (import ./cider-2.nix) {inherit prev;};
      bun-baseline = pkgs.callPackage (import ./bun-baseline.nix) {};
      geode-cli = pkgs.callPackage (import ./geode-cli.nix) {};
      wine-discord-ipc-bridge = pkgs.callPackage (import ./wine-discord-ipc-bridge.nix) {};
    })
  ];
}
