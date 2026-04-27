{
  lib,
  config,
  ...
}: {
  home.file = lib.mkMerge [
    (builtins.mapAttrs (_: path: {
        source = path;
      })
      config.files.source)

    (builtins.mapAttrs (_: path: {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/${path}";
      })
      config.files.symlink)

    (lib.mkMerge (
      builtins.map (name: lib.setAttrByPath [name "force"] true) (
        builtins.attrNames config.files.force
      )
    ))

    (lib.mkMerge (
      builtins.map (name: lib.setAttrByPath [name "force"] (lib.mkForce true)) (
        builtins.attrNames config.files.mkForce
      )
    ))
  ];

  options.files = {
    symlink = lib.mkOption {
      default = {};
      type = lib.types.attrsOf lib.types.str;
    };

    source = lib.mkOption {
      default = {};
      type = lib.types.attrsOf lib.types.path;
    };

    force = lib.mkOption {
      default = {};
      type = lib.types.attrsOf lib.types.bool;
    };

    mkForce = lib.mkOption {
      default = {};
      type = lib.types.attrsOf lib.types.bool;
    };
  };
}
