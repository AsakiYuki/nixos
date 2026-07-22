{
  pkgs,
  osconfig,
  config,
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
  gtk.theme.name = "catppuccin-mocha-sapphire-compact";

  programs.kde.kdeglobals = let
    isTilingWindowsManager =
      (lib.attrByPath ["device" "wm" "hyprland" "enable"] false osconfig)
      || (lib.attrByPath ["device" "wm" "niri" "enable"] false osconfig);
  in {
    initExtra = lib.optionalString isTilingWindowsManager (
      builtins.readFile (
        (pkgs.catppuccin-kde.override {
          flavour = ["mocha"];
          accents = ["sapphire"];
        })
        + "/share/color-schemes/CatppuccinMochaSapphire.colors"
      )
    );
    config = lib.optionalAttrs isTilingWindowsManager {
      UiSettings = {
        ColorScheme = "qt6ct";
      };

      General = {
        TerminalApplication = let
          cfg = config.programs;
        in
          if (cfg.ghostty.enable)
          then "ghostty"
          else if (cfg.kitty.enable)
          then "kitty"
          else "";
      };

      Icons = {
        Theme = "Papirus";
      };
    };
  };
}
