{
  pkgs,
  lib,
  ...
}: let
  catppuccin-gtk = pkgs.catppuccin-gtk.override {
    variant = "mocha";
    accents = ["sapphire"];
    size = "compact";
  };
in {
  home.activation.copyGtkTheme = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p "$HOME/.themes/"

    if [ ! -d "$HOME/.themes/catppuccin-mocha-sapphire-compact" ]; then
        cp -r "${catppuccin-gtk}/share/themes/catppuccin-mocha-sapphire-compact" "$HOME/.themes/"
    fi

    if [ ! -d "$HOME/.themes/catppuccin-mocha-sapphire-compact-hdpi" ]; then
        cp -r "${catppuccin-gtk}/share/themes/catppuccin-mocha-sapphire-compact-hdpi" "$HOME/.themes/"
    fi

    if [ ! -d "$HOME/.themes/catppuccin-mocha-sapphire-compact-xhdpi" ]; then
        cp -r "${catppuccin-gtk}/share/themes/catppuccin-mocha-sapphire-compact-xhdpi" "$HOME/.themes/"
    fi
  '';
}
