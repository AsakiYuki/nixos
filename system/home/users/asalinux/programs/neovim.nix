{ pkgs, ... }:
{
    enable = true;

    plugins = with pkgs.vimPlugins [
        catppuccin-nvim
    ];
}