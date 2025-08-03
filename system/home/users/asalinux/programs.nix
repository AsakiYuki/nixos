{ pkgs, ... }:
{
    programs = {
        ghostty = import ./programs/ghostty.nix {};
        kitty = import ./programs/kitty.nix {};
        tmux = import ./programs/tmux.nix { inherit pkgs; };
        bash = import ./programs/bash.nix {};
        fastfetch = import ./programs/fastfetch.nix {};
        starship = import ../../../../root/programs/starship.nix {};
        vscode = import ./programs/vscode.nix { inherit pkgs; };
        git = import ./programs/git.nix {};
        hyprlock = import ./programs/hyprlock.nix {};
        zen-browser = import ./programs/zen-browser.nix {};
        neovim = import ./programs/neovim.nix {};
    };
}