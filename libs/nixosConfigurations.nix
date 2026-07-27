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
              inherit
                self
                libs
                inputs
                custom
                unstable
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
                ]

                [
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
                          trusted-users = [
                            "root"
                            "@wheel"
                            "asakiyuki"
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
                        backupCommand = ''mv "$1" "$1.bak.$(date +%Y%m%d_%H%M%S)"'';
                      };
                    };
                    options.device.flake-name = lib.mkOption {
                      type = lib.types.str;
                      default = name;
                      description = "Flake name for quick rebuild";
                    };
                  }
                ]
              ]);
          };
        }
      ) (lib.attrsToList cfg)
    );
  }
