{...}: {
  nixpkgs.overlays = [
    (final: prev: {
      lib =
        final.lib.extend (finalLib: extendLib: import ../libs/default.nix);
    })
  ];
}
