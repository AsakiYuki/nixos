{
  pkgs,
  osconfig,
  config,
  lib,
  ...
}:
let
  catppuccin-gtk = pkgs.catppuccin-gtk.override {
    variant = "mocha";
    accents = [ "sapphire" ];
    size = "compact";
  };
in
{
  home.activation.copyGtkTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
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
    platformTheme.name =
      if (lib.attrByPath [ "device" "de" "kdePlasma" "enable" ] false osconfig) then "kde" else "qtct";
    style = {
      package = with pkgs; [
        catppuccin-qt5ct
        catppuccin-kde
        kdePackages.breeze
      ];
    };
  };

  # GTK
  gtk = {
    enable = true;
    theme.name = "catppuccin-mocha-sapphire-compact";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.kde.kdeglobals =
    let
      isTilingWindowsManager =
        (lib.attrByPath [ "device" "wm" "hyprland" "enable" ] false osconfig)
        || (lib.attrByPath [ "device" "wm" "niri" "enable" ] false osconfig);
    in
    {
      enable = isTilingWindowsManager;
      initExtra = lib.optionalString isTilingWindowsManager (
        builtins.readFile (
          (pkgs.catppuccin-kde.override {
            flavour = [ "mocha" ];
            accents = [ "sapphire" ];
          })
          + "/share/color-schemes/CatppuccinMochaSapphire.colors"
        )
      );
      config = lib.optionalAttrs isTilingWindowsManager {
        UiSettings = {
          ColorScheme = "qt6ct";
        };

        General = {
          TerminalApplication =
            let
              cfg = config.programs;
            in
            if (cfg.ghostty.enable) then
              "ghostty"
            else if (cfg.kitty.enable) then
              "kitty"
            else
              "";
        };

        Icons = {
          Theme = "Papirus";
        };
      };
    };

  xdg.configFile."autostart/apply-catppuccin-theme.desktop" =
    let
      kdePlasmaEnabled = lib.attrByPath [ "device" "de" "kdePlasma" "enable" ] false osconfig;
      script = pkgs.writeShellScript "apply-catppuccin-theme" ''
        if [ ! -f "$HOME/.config/.catppuccin_applied" ]; then
          ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-colorscheme CatppuccinMochaSapphire
          touch "$HOME/.config/.catppuccin_applied"
        fi
      '';
    in
    lib.mkIf kdePlasmaEnabled {
      text = ''
        [Desktop Entry]
        Type=Application
        Name=Apply Catppuccin Theme
        Exec=${script}
        Hidden=false
        NoDisplay=true
        X-KDE-autostart-phase=1
      '';
    };
}
