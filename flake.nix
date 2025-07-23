{
    description = "Asa's Nix configuration";
    
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager.url = github:nix-community/home-manager/release-25.05;
    };

    outputs = { self, nixpkgs, unstable, home-manager, ... }:
    
    let unstablePkgs = import unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
    };
    
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {
                inherit unstablePkgs home-manager;
            };
            modules = [ ./system/configuration.nix ];
        };
    };
}