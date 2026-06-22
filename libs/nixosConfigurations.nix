{
  inputs,
  self,
  state-version,
  lib,
  libs,
}: let
  nixosModules = name: inputs.${name}.nixosModules.default;
in
  cfg: {
    nixosConfigurations = lib.mergeAttrsList (map ({
      name,
      value,
    }: {
      "${name}" = lib.nixosSystem (let
        getOpt = name: defaultValue: (lib.attrByPath [name] defaultValue value);
      in rec {
        system = getOpt "system" "x86_64-linux";
        specialArgs = (lib.mergeAttrs {
          inherit self libs inputs;
          custom = import ../packages/default.nix inputs;
          unstable = import inputs.unstablepkgs {
            localSystem = system;
            config.allowUnfree = true;
          };
        } (getOpt "specialArgs" {}));
        modules =
          (getOpt "modules" [])
          ++ [
            (nixosModules "nix-index-database")
            (nixosModules "home-manager")
            {
              system.stateVersion = state-version;
              options.device.flake-name = lib.mkOption {
                type = lib.types.str;
                default = name;
                description = "Flake name for quick rebuild";
              };
            }
          ];
      });
    }) (lib.attrsToList cfg));
  }
