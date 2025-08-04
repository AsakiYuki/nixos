{ pkgs, ... }:
{
    programs.nixvim.enable = true;
    
    imports = [
        ./colorschemes.nix
        ./plugins/plugins.nix
        ./plugins/extraPlugins.nix
    ];
}
