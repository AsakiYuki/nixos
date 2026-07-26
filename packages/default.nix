{...}: {
  bun = import ./bun.nix;
  cage-xtmapper = {version ? "0.2.0"}: import ./cage-xtmapper-${version}.nix;
  cider-2 = import ./cider-2.nix;
  geode-cli = import ./geode-cli.nix;
  wine-discord-ipc-bridge = import ./wine-discord-ipc-bridge.nix;
}
