{ pkgs, ... }:
{
    # Fonts

    # Nerd Fonts
    fonts.packages = with pkgs; [
        (nerdfonts.override {
            fonts = [
                "SauceCodePro"
            ];
        })
    ];
}