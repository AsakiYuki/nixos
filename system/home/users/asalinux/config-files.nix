{ pkgs, }:
{
    "kdeglobals".text =
    builtins.readFile ((pkgs.catppuccin-kde.override { flavour = ["mocha"]; accents = ["mauve"]; }) + "/share/color-schemes/CatppuccinMochaMauve.colors") +
    ''

        [UiSettings]
        ColorScheme=qt6ct
    
        [General]
        TerminalApplication=kitty
    '';
}
