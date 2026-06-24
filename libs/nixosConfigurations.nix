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
    }: let
      sys = value.system or "x86_64-linux";
    in {
      "${name}" = lib.nixosSystem {
        system = sys;

        specialArgs = lib.mergeAttrs {
          inherit self libs inputs;
          custom = import ../packages/default.nix inputs;
          unstable = import inputs.unstablepkgs {
            localSystem = sys;
            config.allowUnfree = true;
          };
        } (value.specialArgs or {});

        modules =
          (value.modules or [])
          ++ [
            (nixosModules "nix-index-database")
            (nixosModules "home-manager")
            (libs.root "/options/system/default.nix")
            ../options/users.nix
            {
              config.system.stateVersion = state-version;
              options.device.flake-name = lib.mkOption {
                type = lib.types.str;
                default = name;
                description = "Flake name for quick rebuild";
              };
            }
          ];
      };
    }) (lib.attrsToList cfg));
  }
