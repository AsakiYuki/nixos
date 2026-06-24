{
  lib,
  inputs,
  state-version,
  unstable,
  custom,
  libs,
  ...
}: {
  root = path: ../. + path;
  mkUsers = users:
    lib.mergeAttrsList (map ({
      name,
      value,
    }: let
      root = value.root or {};
      home = value.home or {};
    in {
      users.users.${name} = lib.mergeAttrs {isNormalUser = true;} root;
      home-manager.users =
        if (value.home != null)
        then {
          "${name}" = lib.mergeAttrs home {
            _module.args = lib.mergeAttrs {
              inherit inputs unstable custom libs;
            } (lib.attrByPath ["_module" "args"] {} home);

            imports = lib.concatLists [
              [
                ../options/home/default.nix
                inputs.nixvim.homeModules.nixvim
                inputs.nixcord.homeModules.nixcord
                inputs.niri.homeModules.niri
              ]
              (home.imports or [])
            ];

            home = {
              username = name;
              stateVersion = state-version;
            };
          };
        }
        else {};
    }) (lib.attrsToList users));
}
