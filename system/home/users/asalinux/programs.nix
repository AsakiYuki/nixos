{ inputs, pkgs, ... }:
{
    programs = {
        kitty = import ./programs/kitty.nix {};
        bash = import ./programs/bash.nix {};
        starship = import ../../../modules/programs/starship.nix {};
        vscode = import ./programs/vscode.nix { inherit pkgs; };
    };
}