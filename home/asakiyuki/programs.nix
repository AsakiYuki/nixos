{ ... }:
{
  imports = [
    ../../modules/features/home/ghostty.nix
    ../../modules/features/home/kitty.nix
    ../../modules/features/home/browsers.nix
    # ../../modules/features/home/neovide.nix

    ../../modules/features/home/bash.nix
    ../../modules/features/home/starship.nix
    ../../modules/features/home/tmux.nix
    ../../modules/features/home/fastfetch.nix
    ../../modules/features/home/vscode.nix
    ../../modules/features/home/obs-studio.nix
    ../../modules/features/home/xdg.nix
    ../../modules/features/home/packages.nix
    ../../modules/features/home/git.nix

    ../../modules/programs/nixvim/_nixvim.nix
    ../../modules/programs/nixcord/default.nix
    ../../modules/features/home/niri.nix
    ../../modules/programs/hyprland/default.nix
  ];
}
