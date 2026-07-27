{
  inputs,
  self,
  state-version,
  lib,
} @ args: let
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
          libs = import ../libs (lib.mergeAttrs args {inherit unstable libs;});
        in {
          "${name}" = lib.nixosSystem {
            system = sys;

            specialArgs = lib.mergeAttrs {
              inherit
                self
                libs
                inputs
                unstable
                state-version
                name
                ;
            } (value.specialArgs or {});

            modules =
              (value.modules or [])
              ++ (lib.concatLists [
                (with inputs; [
                  chaotic.nixosModules.default
                ])

                [
                  (nixosModules "nix-index-database")
                  (nixosModules "home-manager")
                  (nixosModules "agenix")
                  (libs.root "/overlays")
                  (libs.root "/modules/system")
                  (libs.root "/options/system")
                  (libs.root "/modules/nixos-default-config")
                ]
              ]);
          };
        }
      ) (lib.attrsToList cfg)
    );
  }
