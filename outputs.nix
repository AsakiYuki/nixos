{
  self,
  nixpkgs,
  unstablepkgs,
  ...
} @ inputs: let
  state-version = "26.05";
  lib = nixpkgs.lib;
  libs = import ./libs/default.nix inputs;
  custom = import ./packages/default.nix inputs;

  mkNixOSSystem = {
    name,
    modules ? [],
    system ? "x86_64-linux",
  }: let
    nixosModules = name: inputs.${name}.nixosModules.default;
  in {
    "${name}" = lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit self custom libs inputs state-version;
        unstable = import unstablepkgs {
          localSystem = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      modules = builtins.concatLists [
        modules
        [
          (libs.root "/libs/flake-name.nix")
          (nixosModules "nix-index-database")
          (nixosModules "home-manager")
          {device.flake-name = name;}
        ]
      ];
    };
  };

  nixosConfigs = cfg: {
    nixosConfigurations = lib.mergeAttrsList (
      lib.map ({
        name,
        value,
      }: (
        mkNixOSSystem {
          name = name;
          modules = value.modules;
          system = lib.attrByPath ["system"] "x86_64-linux" cfg;
        }
      )) (lib.attrsToList cfg)
    );
  };
in
  nixosConfigs {
    ideapad-slim-5 = {
      modules = [
        inputs.nixos-hardware.nixosModules.lenovo-ideapad-slim-5
        inputs.lanzaboote.nixosModules.lanzaboote
        (libs.root "/devices/ideapad-slim-5/configuration.nix")
      ];
    };
    home-server = {
      modules = [
        (libs.root "/devices/home-server/configuration.nix")
      ];
    };
  }
