{ pkgs, osconfig, ... }:
{
    home.file = {
        ".config/qt5ct/colors/Catppuccin-Mocha.conf".source = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/Catppuccin-Mocha.conf";
        ".config/qt6ct/colors/Catppuccin-Mocha.conf".source = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/Catppuccin-Mocha.conf";
    };

    xdg.configFile = {
        kdeglobals.text = builtins.readFile ((pkgs.catppuccin-kde.override { flavour = ["mocha"]; accents = ["sapphire"]; }) + "/share/color-schemes/CatppuccinMochaSapphire.colors") +
        ''

            [UiSettings]
            ColorScheme=qt6ct
        
            [General]
            TerminalApplication=${osconfig.device.programs.terminal}
        '';
    };
}