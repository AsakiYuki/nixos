{ lib, ... }:
{
  options.device.files = {
    symlink = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.str;
    };

    source = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.path;
    };

    force = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.bool;
    };

    mkForce = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.bool;
    };
  };
}
