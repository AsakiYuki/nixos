{
  description = "The Asa's nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstablepkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    niri.url = "github:sodiboo/niri-flake";
    catppuccin.url = "github:catppuccin/nix";

    nixcord.url = "github:FlameFlag/nixcord";
    nixcord.inputs.nixpkgs.follows = "nixpkgs";

    hytale-launcher.url = "github:zarilion/hytale-launcher-nix";
    hytale-launcher.inputs.nixpkgs.follows = "nixpkgs";

    dolphin-overlay.url = "github:asakiyuki/dolphin-overlay";
    dolphin-overlay.inputs.nixpkgs.follows = "nixpkgs";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nix-minecraft.inputs.nixpkgs.follows = "nixpkgs";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    millennium.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-26.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-26.05";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    state-version = "26.05";
    lib = nixpkgs.lib;
    root = path: ./. + path;
  in
    import ./libs/nixosConfigurations.nix {inherit inputs self state-version lib;} {
      ideapad-slim-5 = {
        modules = [
          inputs.nixos-hardware.nixosModules.lenovo-ideapad-slim-5
          inputs.lanzaboote.nixosModules.lanzaboote
          (root "/devices/ideapad-slim-5/configuration.nix")
        ];
      };
      home-server = {
        modules = [
          (root "/devices/home-server/configuration.nix")
        ];
      };
      wsl = {
        modules = [
          inputs.nixos-wsl.nixosModules.default
          (root "/host/wsl/configuration.nix")
        ];
      };
    };
}
