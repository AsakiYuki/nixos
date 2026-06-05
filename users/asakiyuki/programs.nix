{
  lib,
  pkgs,
  osconfig,
  ...
}: {
  imports = [
    ../../modules/features/home/ghostty.nix
    ../../modules/features/home/kitty.nix
    ../../modules/features/home/browsers.nix

    ../../modules/features/home/bash.nix
    ../../modules/features/home/starship.nix
    ../../modules/features/home/tmux.nix
    ../../modules/features/home/fastfetch.nix
    ../../modules/features/home/vscode.nix
    ../../modules/features/home/obs-studio.nix
    ../../modules/features/home/xdg.nix
    ../../modules/features/home/git.nix
    ../../modules/features/home/yt-dlp.nix
    ../../modules/features/home/dolphin.nix
    ../../modules/features/home/fzf.nix

    ../../modules/programs/nixvim/_nixvim.nix
    ../../modules/programs/nixcord/default.nix
    ../../modules/features/home/niri.nix
    ../../modules/programs/hyprland/default.nix
  ];

  programs.kde.kdeglobals = let
    isTilingWindowsManager =
      osconfig.device.wm.hyprland.enable
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
        TerminalApplication = osconfig.device.programs.terminal.name;
      };

      Icons = {
        Theme = "Papirus";
      };
    };
  };
}
