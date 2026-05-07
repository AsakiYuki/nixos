{lib, ...}: {
  options.programs.kde.kdeglobals = {
    enable = lib.mkEnableOption "kdeglobals";
    initExtra = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    config = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.attrsOf (lib.types.oneOf [
          lib.types.str
          lib.types.bool
          lib.types.int
        ])
      );
      default = {};
    };
  };
}
