{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      iris = inputs.iris.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (finalAttrs: prevAttrs: {
        vendorHash = "sha256-KQNloP/Aj283YQ4d5LFu/2Pbb2HbVTZPhLK1fs4xvGw=";
      });
    })
  ];
}
