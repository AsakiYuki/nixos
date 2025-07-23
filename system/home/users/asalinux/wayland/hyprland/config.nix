{ config, pkgs }:
{
    enable = true;
    xwayland.enable = true;

    settings = import ./settings.nix { inherit config; };
}