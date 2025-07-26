{ inputs, pkgs, ... }:
{
    programs = {
        # Import nix
        spicetify = import ./programs/spicetify.nix { inherit inputs pkgs; };
        starship = import ../../root/programs/starship.nix {};
        bash = import ../../root/programs/shell.nix {};

        # Configs
        steam.enable = true;
        honkers-railway-launcher.enable = true;
        
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };
}