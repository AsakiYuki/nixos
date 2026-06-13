{pkgs, ...}: {
  bun = import ./bun.nix;
  cage-xtmapper = {version ? "0.2.0"}: import ./cage-xtmapper-${version}.nix;
  catppuccin-obs = import ./catppuccin-obs.nix;
  cider-2 = import ./cider-2.nix {inherit pkgs;};
  cursors = {
    name ? "aemeath",
    size ? 48,
  }: (import ./custom-cursors.nix {
    cursors = name;
    size = size;
  });
}
