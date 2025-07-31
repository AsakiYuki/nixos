{
    description = "Asa's Nix configuration";
    
    inputs = {
        # Default Packages
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        unstablepkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = github:nix-community/home-manager/release-25.05;

        # Extra Packages
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
        catppuccin.url = "github:catppuccin/nix";
        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
        dolphin-overlay.url = "github:rumboon/dolphin-overlay";
    };

    outputs = inputs@{
        self,
        catppuccin,
        nixpkgs,
        unstablepkgs,
        zen-browser,
        home-manager,
        spicetify-nix,
        dolphin-overlay,
        ...
    }:
    
    let
        unstable = import unstablepkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
        };
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {
                inherit inputs nixpkgs unstable home-manager;
            };
            modules = [
                {
                    nixpkgs.overlays = [ dolphin-overlay.overlays.default ];
                }
                ./system/configuration.nix
            ];
        };
    };
}