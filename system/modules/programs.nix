{ inputs, pkgs, ... }:
{
    programs = {
        # Import nix
        spicetify = import ./programs/spicetify.nix { inherit inputs pkgs; };

        # Configs
        steam.enable = true;
        
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };
}