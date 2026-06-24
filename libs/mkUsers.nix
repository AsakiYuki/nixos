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
        ../options/home/default.nix
        ../modules/features/home/default.nix

        (libs.root "/modules/programs/hyprland/default.nix")
        (libs.root "/modules/programs/nixcord/default.nix")
        (libs.root "/modules/programs/nixvim/_nixvim.nix")

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
}) (lib.attrsToList users))
