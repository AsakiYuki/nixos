{
  lib,
  osconfig,
  pkgs,
  config,
  ...
}: {
  programs.kde.kdeglobals = let
    isTilingWindowsManager =
      (lib.attrByPath ["device" "wm" "hyprland" "enable"] false osconfig)
      || (lib.attrByPath ["device" "wm" "niri" "enable"] false osconfig);
  in {
    enable = isTilingWindowsManager;
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
