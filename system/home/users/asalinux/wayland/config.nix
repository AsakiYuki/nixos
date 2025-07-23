{ config, pkgs, ... }:
{
    wayland.windowManager = {
        hyprland = import ./hyprland/config.nix { inherit config pkgs; };
    };
}