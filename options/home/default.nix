{
  lib,
  config,
  custom,
  pkgs,
  ...
}: {
  imports = [
    ./programs.nix
    ./file.nix
  ];
  options = {
    theme.cursors = lib.mkOption {
      type = lib.types.str;
      default = null;
      description = "Cursor theme to use for the desktop";
    };
  };

  config = lib.mkIf (config.theme.cursors != null) {
    home.pointerCursor =
      (custom.cursors {
        name = config.theme.cursors;
        size = 48;
      })
      {inherit pkgs;};
  };
}
