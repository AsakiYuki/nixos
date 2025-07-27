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
        sessionVariables = import ./env.nix { inherit config; };
        file = import ./files.nix { inherit pkgs; };
        pointerCursor = import ./pointer.nix { inherit pkgs; };
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

    # GTK
    gtk = {
        theme = {
            name = "catppuccin-mocha-blue-compact";
            package = pkgs.catppuccin-gtk;
        };
    };

    # Catppuccin
    catppuccin = {
        fcitx5 = {
            enable = true;
            enableRounded = false;
            flavor = "mocha";
            accent = "blue";
        };

        gtk = {
            enable = true;
            flavor = "mocha";
            accent = "blue";
            size = "compact";
        };

        obs = {
            enable = true;
            flavor = "mocha";
        };
    };
}