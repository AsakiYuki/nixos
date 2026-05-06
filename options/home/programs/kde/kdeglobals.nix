{lib, ...}: {
  options.programs.kde.kdeglobals = {
    initExtra = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };
}
