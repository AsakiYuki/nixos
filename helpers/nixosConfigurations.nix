{
  inputs,
  self,
  state-version,
  lib,
}: let
  nixosModules = name: inputs.${name}.nixosModules.default;
in
  cfg: {
    nixosConfigurations = lib.mergeAttrsList (
      map (
        {
          name,
          value,
        }: let
          sys = value.system or "x86_64-linux";
          unstable = import inputs.unstablepkgs {
            localSystem = sys;
            config.allowUnfree = true;
          };
          extendedLib = lib.extend (final: prev:
            import ../helpers {
              inherit inputs self state-version unstable name;
              lib = final;
            });
        in {
          "${name}" = extendedLib.nixosSystem {
            system = sys;

            specialArgs = extendedLib.mergeAttrs {
              inherit
                self
                inputs
                unstable
                state-version
                name
                ;

              lib = extendedLib;
            } (value.specialArgs or {});

            modules =
              (value.modules or [])
              ++ (extendedLib.concatLists [
                (with inputs; [
                  chaotic.nixosModules.default
                ])

                [
                  (nixosModules "nix-index-database")
                  (nixosModules "home-manager")
                  (nixosModules "agenix")
                  (extendedLib.root "/modules/nixos-default.nix")
                  (extendedLib.root "/overlays")
                  (extendedLib.root "/modules/system")
                  (extendedLib.root "/options/system")
                ]
              ]);
          };
        }
      ) (lib.attrsToList cfg)
    );
  }
