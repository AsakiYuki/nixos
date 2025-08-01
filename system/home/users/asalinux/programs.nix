{ pkgs, ... }:
{
    programs = {
        ghostty = import ./programs/ghostty.nix {};
        bash = import ./programs/bash.nix {};
        fastfetch = import ./programs/fastfetch.nix {};
        starship = import ../../../../root/programs/starship.nix {};
        vscode = import ./programs/vscode.nix { inherit pkgs; };
        git = import ./programs/git.nix {};
        hyprlock = import ./programs/hyprlock.nix {};
        zen-browser = import ./programs/zen-browser.nix {};
    };
}