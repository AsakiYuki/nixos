{ ... }:
{
    programs.nixvim.plugins = {
        neo-tree = import ./neotree.nix;
    };
}