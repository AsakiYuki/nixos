{ inputs, pkgs, ... }:
{
    programs = {
        # Import nix
        spicetify = import ./programs/spicetify.nix { inherit inputs pkgs; };
        starship = import ../../root/programs/starship.nix {};
        bash.shellAliases = import ../../root/shellAliases.nix {};

        # Configs
        steam.enable = true;
        
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };
}