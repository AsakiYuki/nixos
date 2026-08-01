{
  lib,
  inputs,
  state-version,
  unstable,
  ...
}: osconfig: users:
lib.mergeAttrsList (
  map (
    {
      name,
      value,
    }: let
      root = value.root or {};
      home = value.home or {};
    in {
      users.users.${name} = lib.mergeAttrs {isNormalUser = true;} root;

      home-manager.users.${name} = lib.mergeAttrs home {
        _module.args = lib.mergeAttrs {
          inherit
            inputs
            unstable
            osconfig
            ;
        } (lib.attrByPath ["_module" "args"] {} home);

        imports = lib.concatLists [
          [
            ../options/home
            ../modules/home
          ]

          (with inputs; [
            chaotic.homeModules.default
          ])

          [
            inputs.nixvim.homeModules.nixvim
            inputs.nixcord.homeModules.nixcord
            inputs.agenix.homeManagerModules.default
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
  ) (lib.attrsToList users)
)
