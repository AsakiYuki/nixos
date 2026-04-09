{ ... }@inputs:
{
    bun = import ./bun.nix;
    cage-xtmapper = { version ? "0.2.0" }: import ./cage-xtmapper-${version}.nix;
    catppuccin-obs = import ./catppuccin-obs.nix;
    cursors = { name ? "aemeath", size ? 48 }: (import ./custom-cursors.nix { cursors = name; size = size; });
}