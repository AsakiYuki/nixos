{ config, pkgs, ... }:

{
  enable = true;
  xwayland.enable = true;

  settings = import ./hyprland/settings.nix { inherit config; }; 
  # plugins = import ./hyprland/plugins.nix { inherit pkgs; }; 
}
