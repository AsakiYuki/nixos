{ ... }:
{
    programs.nixvim.plugins = {
        neo-tree = import ./neotree.nix {};
        web-devicons = import ./web-devicons.nix {};
    };
}