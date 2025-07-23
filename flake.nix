{
    description = "Asa's Nix configuration";
    
    inputs = {
        # Default Packages
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = github:nix-community/home-manager/release-25.05;

        # Extra Packages
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
    };

    outputs = inputs@{ self, nixpkgs, unstable, zen-browser, home-manager, ... }:
    
    let unstablePkgs = import unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
    };
    
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {
                inherit inputs nixpkgs unstablePkgs home-manager;
            };
            modules = [ ./system/configuration.nix ];
        };
    };
}