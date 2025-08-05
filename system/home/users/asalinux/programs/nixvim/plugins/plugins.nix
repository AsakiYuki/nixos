{ ... }:
{
    programs.nixvim.plugins = {
        neo-tree = import ./neotree.nix {};
        web-devicons = import ./web-devicons.nix {};
        which-key = import ./which-key.nix {};
        treesitter = import ./treesitter.nix {};
    };
}