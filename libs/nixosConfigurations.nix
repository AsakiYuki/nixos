{
  inputs,
  self,
  state-version,
  lib,
} @ args: let
  nixosModules = name: inputs.${name}.nixosModules.default;
in
  cfg: {
    nixosConfigurations = lib.mergeAttrsList (map ({
      name,
      value,
    }: let
      sys = value.system or "x86_64-linux";
      custom = import ../packages inputs;
      unstable = import inputs.unstablepkgs {
        localSystem = sys;
        config.allowUnfree = true;
      };
      libs = import ../libs (lib.mergeAttrs args {inherit custom unstable libs;});
    in {
      "${name}" = lib.nixosSystem {
        system = sys;

        specialArgs = lib.mergeAttrs {
          inherit self libs inputs custom unstable;
        } (value.specialArgs or {});

        modules =
          (value.modules or [])
          ++ [
            inputs.chaotic.nixosModules.nyx-cache
            inputs.chaotic.nixosModules.nyx-registry

            (nixosModules "nix-index-database")
            (nixosModules "home-manager")
            (nixosModules "agenix")
            (libs.root "/modules/features/system")
            (libs.root "/overlays/nixpkgs.nix")
            (libs.root "/options/system")
            {
              config = {
                nixpkgs.config.allowUnfree = true;
                time.timeZone = "Asia/Ho_Chi_Minh";
                system.stateVersion = state-version;
                nix = {
                  settings = {
                    auto-optimise-store = true;
                    experimental-features = [
                      "nix-command"
                      "flakes"
                    ];
                  };
                  gc = {
                    automatic = true;
                    dates = "weekly";
                    options = "--delete-older-than 30d";
                  };
                };
                networking.hostName = "nixos";
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = true;
                  backupFileExtension = "bak";
                };
              };
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
