{ pkgs, lib, osconfig, ... }:
{
    home.file = {
        ".config/qt5ct/colors/Catppuccin-Mocha.conf".source = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/catppuccin-mocha-sapphire.conf";
        ".config/qt6ct/colors/Catppuccin-Mocha.conf".source = "${pkgs.catppuccin-qt5ct}/share/qt6ct/colors/catppuccin-mocha-sapphire.conf";

        ".local/share/kio/servicemenus/open-with-code.desktop".source = ../../../configs/services-menu/open-with-code.desktop;
        ".local/share/kio/servicemenus/open-ghostty-here.desktop".source = ../../../configs/services-menu/open-ghostty-here.desktop;

        ".mozilla/firefox/default/search.json.mozlz4".force = lib.mkForce true;
        ".config/dolphinrc" = {
            force = true;
            source = ../../../configs/dolphinrc;
        };
    };

    xdg.configFile = {
        kdeglobals.text = builtins.readFile ((pkgs.catppuccin-kde.override { flavour = ["mocha"]; accents = ["sapphire"]; }) + "/share/color-schemes/CatppuccinMochaSapphire.colors") +
        ''

            [UiSettings]
            ColorScheme=qt6ct
        
            [General]
            TerminalApplication=${osconfig.device.programs.terminal}

            [Icons]
            Theme=Papirus
        '';
    };
}