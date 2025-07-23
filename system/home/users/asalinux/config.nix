{ config, pkgs, ... }:
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
        file = import ./files.nix { inherit pkgs; };
    };

    # QT
    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style.package = with pkgs; [
            catppuccin-qt5ct
            catppuccin-kde
            kdePackages.breeze
        ];
    };
}