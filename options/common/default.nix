{ lib, ... }:
{
  imports = [
    ./programs.nix
    ./file.nix
  ];

  options.device = {
    flatpak.enable = lib.mkEnableOption "flatpak";
    flake-name = lib.mkOption {
      type = lib.types.str;
      default = "desktop";
      description = "Flake name for quick rebuild";
    };
  };
}
