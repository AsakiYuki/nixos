{ pkgs, lib, ... }:
{
    imports = [
        ./programs/tmux.nix
        ./programs/vscode.nix
        ./programs/ghostty.nix
        ./programs/kitty.nix
        ./programs/bash.nix
        ./programs/fastfetch.nix
        ./programs/starship.nix
        ./programs/git.nix
        ./programs/hyprlock.nix
        ./programs/zen-browser.nix
        ./programs/nixvim/app.nix
    ];
}
