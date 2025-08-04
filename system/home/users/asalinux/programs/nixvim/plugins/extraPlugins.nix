{ pkgs, ... }:
let
    plugins = pkgs.vimPlugins;
in
{
    programs.nixvim.extraPlugins = [
        (import ./neocord.nix { inherit plugins; })
    ];
}