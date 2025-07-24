{
    description = "Asa's Nix configuration";
    
    inputs = {
        # Default Packages
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = github:nix-community/home-manager/release-25.05;

        # Extra Packages
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
        catppuccin.url = "github:catppuccin/nix";
        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    };

    outputs = inputs@{
        self,
        catppuccin,
        nixpkgs,
        unstable,
        zen-browser,
        home-manager,
        spicetify-nix,
        ...
    }:
    
    let
        unstablePkgs = import unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
        };
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {
                inherit inputs nixpkgs unstablePkgs home-manager;
            };
            modules = [
                catppuccin.nixosModules.catppuccin
                ./system/configuration.nix
            ];
        };
    };
}