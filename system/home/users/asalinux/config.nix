{ inputs, config, pkgs, ... }:
{
    # Imports nix
    imports = [
        ./programs.nix
        ./services.nix
        ./i18n.nix
        ./xdg.nix
        ./wayland/config.nix
    ];

    # Configs
    home = {
        username = "asalinux";
        homeDirectory = "/home/asalinux";
        stateVersion = "25.05";
        sessionVariables = import ./env.nix {};
    };
}