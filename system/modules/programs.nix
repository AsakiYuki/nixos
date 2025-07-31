{ inputs, pkgs, ... }:
{
    programs = {
        # Import nix
        spicetify = import ./programs/spicetify.nix { inherit inputs pkgs; };
        starship = import ../../root/programs/starship.nix {};
        bash = import ../../root/programs/shell.nix {};
        git = import ../../root/programs/git.nix {};

        # Configs
        steam.enable = true;

        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };

    virtualisation = {
        waydroid.enable = true;
    };
}