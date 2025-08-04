{ pkgs, ... }:
let
    EXTRA_PLUGINS = [
        ./neocord.nix
    ];

    LUA = [
        ./lua/neocord.lua
    ];
in
{
    programs.nixvim = {
        extraPlugins = map (path: import path { plugins = pkgs.vimPlugins; }) EXTRA_PLUGINS;
        extraConfigLua = builtins.concatStringsSep "\n" (map builtins.readFile LUA);
    };
}
