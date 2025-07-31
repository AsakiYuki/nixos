{ pkgs, lib, ... }:
let
    catppuccin-gtk = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "blue" ];
        size = "compact";
    };
in
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
        pointerCursor = import ./pointer.nix { inherit pkgs; };

        activation.copyGtkTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            mkdir -p "$HOME/.themes/"

            if [ ! -d "$HOME/.themes/catppuccin-mocha-blue-compact" ]; then
                cp -r "${catppuccin-gtk}/share/themes/catppuccin-mocha-blue-compact" "$HOME/.themes/"
            fi

            if [ ! -d "$HOME/.themes/catppuccin-mocha-blue-compact-hdpi" ]; then
                cp -r "${catppuccin-gtk}/share/themes/catppuccin-mocha-blue-compact-hdpi" "$HOME/.themes/"
            fi

            if [ ! -d "$HOME/.themes/catppuccin-mocha-blue-compact-xhdpi" ]; then
                cp -r "${catppuccin-gtk}/share/themes/catppuccin-mocha-blue-compact-xhdpi" "$HOME/.themes/"
            fi
        '';
    };

    # QT
    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style = {
            package = with pkgs; [
                catppuccin-qt5ct
                catppuccin-kde
                kdePackages.breeze
            ];
        };
    };

    # GTK
    gtk.theme.name = "catppuccin-mocha-blue-compact";

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