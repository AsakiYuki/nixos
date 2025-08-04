{ pkgs, ... }:
{
    programs = {
        tmux = import ./programs/tmux.nix { inherit pkgs; };
        vscode = import ./programs/vscode.nix { inherit pkgs; };
        nixvim = import ./programs/nixvim/app.nix { inherit pkgs; };
        
        ghostty = import ./programs/ghostty.nix {};
        kitty = import ./programs/kitty.nix {};
        bash = import ./programs/bash.nix {};
        fastfetch = import ./programs/fastfetch.nix {};
        starship = import ../../../../root/programs/starship.nix {};
        git = import ./programs/git.nix {};
        hyprlock = import ./programs/hyprlock.nix {};
        zen-browser = import ./programs/zen-browser.nix {};
    };
}
