{lib, ...}: {
  imports = [
    ./programs.nix
    ./environment.nix
    ./programs.nix
    ./hardware.nix
  ];

  options.device = {
    flatpak.enable = lib.mkEnableOption "flatpak";
    flake-name = lib.mkOption {
      type = lib.types.str;
      default = "desktop";
      description = "Flake name for quick rebuild";
    };

    cursors = lib.mkOption {
      type = lib.types.str;
      default = "aemeath";
      description = "Cursor theme to use for the desktop";
    };
  };
}
