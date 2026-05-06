{lib, ...}: {
  options.programs.dolphin.services-menu = lib.mkOption {
    type = lib.types.attrsOf (lib.types.attrsOf (lib.types.attrsOf lib.types.str));
    default = {};
  };
}
