{
  lib,
  config,
  custom,
  pkgs,
  ...
}: {
  options = {
    theme.cursors = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Cursor theme to use for the desktop";
    };
  };

  config = lib.mkIf (config.theme.cursors != "") {
    home.pointerCursor =
      (custom.cursors {
        name = config.theme.cursors;
        size = 48;
      })
      {inherit pkgs;};
  };
}
