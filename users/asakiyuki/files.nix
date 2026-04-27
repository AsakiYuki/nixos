{
  pkgs,
  lib,
  osconfig,
  ...
}: {
  xdg.configFile.kdeglobals =
    lib.mkIf (osconfig.device.wm.hyprland.enable || osconfig.device.wm.niri.enable)
    {
      text = (
        builtins.readFile (
          (pkgs.catppuccin-kde.override {
            flavour = ["mocha"];
            accents = ["sapphire"];
          })
          + "/share/color-schemes/CatppuccinMochaSapphire.colors"
        )
        + ''

          [UiSettings]
          ColorScheme=qt6ct

          [General]
          TerminalApplication=${osconfig.device.programs.terminal.name}

          [Icons]
          Theme=Papirus
        ''
      );
    };
}
