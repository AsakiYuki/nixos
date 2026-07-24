{
  lib,
  pkgs,
  osconfig,
  ...
}: {
  xdg.configFile."autostart/apply-catppuccin-theme.desktop" = let
    kdePlasmaEnabled = lib.attrByPath ["device" "de" "kdePlasma" "enable"] false osconfig;
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
