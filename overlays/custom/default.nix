final: prev: {
  cage-xtmapper = final.callPackage ./packages/cage-xtmapper.nix {};
  cider-2 = final.callPackage ./packages/cider-2.nix {inherit prev;};
  bun-baseline = final.callPackage ./packages/bun-baseline.nix {};
  geode-cli = final.callPackage ./packages/geode-cli.nix {};
  lsfg-vk = final.callPackage ./packages/lsfg-vk.nix {};
}
