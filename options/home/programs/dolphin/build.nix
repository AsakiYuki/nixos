{
  lib,
  config,
  ...
}: let
  sanitize = lib.mapAttrsRecursive (
    path: value:
      if lib.isList value
      then lib.concatStringsSep "," value
      else value
  );
in {
  config = lib.mkIf config.programs.dolphin.enable {
    # install dolphin package to home
    home.packages = [
      config.programs.dolphin.package
    ];

    home.file = lib.mergeAttrsList [
      {
        # generate dolphinrc file
        ".config/dolphinrc" = {
          text = lib.generators.toINI {} (sanitize config.programs.dolphin.configs);
          force = true;
        };
      }

      # generate service menus
      (builtins.listToAttrs (builtins.map
        ({
          name,
          value,
        }: {
          name = ".local/share/kio/servicemenus/${name}.desktop";
          value = {
            text = lib.generators.toINI {} value;
          };
        })
        (lib.attrsToList config.programs.dolphin.services-menu)))
    ];
  };
}
