{lib, ...}: {
  imports = [
    ./programs.nix
    ./environment.nix
    ./programs.nix
    ./hardware.nix
  ];

  options.device = {
    flatpak.enable = lib.mkEnableOption "flatpak";
    cursors = lib.mkOption {
      type = lib.types.str;
      default = "aemeath";
      description = "Cursor theme to use for the desktop";
    };
  };
}
