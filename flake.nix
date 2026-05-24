{
  description = "The Asa's nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstablepkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hytale-launcher.url = "github:zarilion/hytale-launcher-nix";
    niri.url = "github:sodiboo/niri-flake";
    nixcord.url = "github:FlameFlag/nixcord";
    winegdk.url = "github:fmbearmf/winegdk-nix";
    catppuccin.url = "github:catppuccin/nix";
    dolphin-overlay.url = "github:rumboon/dolphin-overlay";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    # hyprland.url = "github:hyprwm/Hyprland";

    millennium.url = "git+https://git.asakiyuki.com/AsakiYuki/millennium-nix.git?ref=main";
    # honkai-railway-grub-theme.url = "github:voidlhf/StarRailGrubThemes/4a84e576bb544afbdfc76dbe40ffc50a5c2b16de";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

  outputs = {
    self,
    nixpkgs,
    unstablepkgs,
    ...
  } @ inputs: let
    libs = import ./libs/default.nix inputs;
    custom = import ./packages/default.nix inputs;
    unstable = import unstablepkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    specialArgs = {
      inherit
        self
        custom
        libs
        unstable
        inputs
        ;
    };
  in {
    nixosConfigurations = {
      ideapad-slim-5 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = specialArgs;
        modules = [
          inputs.nixos-hardware.nixosModules.lenovo-ideapad-slim-5
          inputs.nix-index-database.nixosModules.default
          inputs.home-manager.nixosModules.default
          inputs.lanzaboote.nixosModules.lanzaboote
          inputs.millennium.nixosModules.default
          (libs.root "/devices/ideapad-slim-5/configuration.nix")
        ];
      };

      home-server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = specialArgs;
        modules = [
          inputs.nix-index-database.nixosModules.default
          inputs.home-manager.nixosModules.default
          (libs.root "/devices/home-server/configuration.nix")
        ];
      };
    };
  };
}
