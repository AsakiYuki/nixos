{ pkgs }:
{
    "kdeglobals".source = "${(pkgs.catppuccin-kde.override { flavour = ["mocha"]; accents = ["mauve"]; })}/share/color-schemes/CatppuccinMochaMauve.colors";
}