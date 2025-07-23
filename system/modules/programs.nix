{ inputs, ... }:
{
    programs = {
        # Import nix
        spicetify = import ./programs/spicetify.nix { inherit input; };

        # Configs
        steam.enable = true;
        
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };
}