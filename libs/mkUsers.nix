{
  lib,
  inputs,
  state-version,
  unstable,
  custom,
  libs,
  ...
}: osconfig: users:
lib.mergeAttrsList (map ({
  name,
  value,
}: let
  root = value.root or {};
  home = value.home or {};
in {
  users.users.${name} = lib.mergeAttrs {isNormalUser = true;} root;

  home-manager.users.${name} = lib.mergeAttrs home {
    _module.args = lib.mergeAttrs {
      inherit inputs unstable custom libs osconfig;
    } (lib.attrByPath ["_module" "args"] {} home);

    imports = lib.concatLists [
      [
        ../options/home
        ../modules/features/home

        (libs.root "/modules/programs/hyprland")
        (libs.root "/modules/programs/nixcord")
        (libs.root "/modules/programs/nixvim")
      ]

      (lib.optional (inputs ? nixvim) inputs.nixvim.homeModules.nixvim)
      (lib.optional (inputs ? nixcord) inputs.nixcord.homeModules.nixcord)
      (lib.optional (inputs ? agenix) inputs.agenix.homeManagerModules.default)
      (lib.optional (inputs ? niri) inputs.niri.homeModules.niri)

      (home.imports or [])
    ];

    home = {
      username = name;
      stateVersion = state-version;
    };
  };
}) (lib.attrsToList users))
