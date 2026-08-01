{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      iris = inputs.iris.packages.${pkgs.stdenv.hostPlatform.system}.default;
    })
  ];
}
