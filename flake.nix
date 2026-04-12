{
  description = "The Asa's nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstablepkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hytale-launcher.url = "github:zarilion/hytale-launcher-nix";
    niri.url = "github:sodiboo/niri-flake";
    hyprland.url = "github:hyprwm/Hyprland";
    nixcord.url = "github:FlameFlag/nixcord";
    dolphin-overlay.url = "github:rumboon/dolphin-overlay";

    honkai-railway-grub-theme.url = "github:voidlhf/StarRailGrubThemes/4a84e576bb544afbdfc76dbe40ffc50a5c2b16de";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      unstablepkgs,
      ...
    }@inputs:
    let
      libs = import ./libs/default.nix inputs;
      custom = import ./packages/default.nix inputs;
      unstable = import unstablepkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        ideapad-slim-5 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              self
              custom
              libs
              unstable
              inputs
              ;
          };
          modules = [
            inputs.nixos-hardware.nixosModules.lenovo-ideapad-slim-5
            inputs.nix-index-database.nixosModules.default
            inputs.home-manager.nixosModules.default
            (libs.root "/devices/ideapad-slim-5/configuration.nix")
          ];
        };
      };
    };
}

