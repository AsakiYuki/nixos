{
  description = "The Asa's nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstablepkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixvim.url = "github:nix-community/nixvim/nixos-26.05";
    hytale-launcher.url = "github:zarilion/hytale-launcher-nix";
    niri.url = "github:sodiboo/niri-flake";
    nixcord.url = "github:FlameFlag/nixcord";
    winegdk.url = "github:fmbearmf/winegdk-nix";
    catppuccin.url = "github:catppuccin/nix";
    dolphin-overlay.url = "github:asakiyuki/dolphin-overlay";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    # hyprland.url = "github:hyprwm/Hyprland";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    # honkai-railway-grub-theme.url = "github:voidlhf/StarRailGrubThemes/4a84e576bb544afbdfc76dbe40ffc50a5c2b16de";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-26.05";
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
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    unstablepkgs,
    ...
  } @ inputs: let
    state-version = "26.05";
    lib = nixpkgs.lib;
    libs = import ./libs/default.nix inputs;
    nixosModules = name: inputs.${name}.nixosModules.default;

    nixosConfigurations = cfg: {
      nixosConfigurations = lib.mergeAttrsList (lib.map ({
        name,
        value,
      }: {
        "${name}" = lib.nixosSystem (let
          getOpt = name: defaultValue: (lib.attrByPath [name] defaultValue value);
        in rec {
          system = getOpt "system" "x86_64-linux";
          specialArgs = {
            inherit self libs inputs state-version;
            custom = import ./packages/default.nix inputs;
            unstable = import unstablepkgs {
              localSystem = system;
              config.allowUnfree = true;
            };
          };
          modules =
            value.modules
            ++ [
              (libs.root "/libs/flake-name.nix")
              (nixosModules "nix-index-database")
              (nixosModules "home-manager")
              {device.flake-name = name;}
            ];
        });
      }) (lib.attrsToList cfg));
    };
  in
    lib.mergeAttrsList [
      (
        nixosConfigurations {
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
      )
    ];
}
