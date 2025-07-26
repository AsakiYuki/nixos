{ inputs, pkgs, ... }:
{
    programs = {
        kitty = import ./programs/kitty.nix {};
        bash = import ./programs/bash.nix {};
        fastfetch = import ./programs/fastfetch.nix {};
        starship = import ../../../../root/programs/starship.nix {};
        vscode = import ./programs/vscode.nix { inherit pkgs; };
        git = import ../../../../root/programs/git.nix {};
    };
}