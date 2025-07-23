{ inputs, nixpkgs, pkgs, unstablePkgs, home-manager, ... }:
{
    # Import nix
    imports = [
        # Require
        ./modules/hardware.nix
        home-manager.nixosModules.default

        # Modules
        ./modules/boot.nix
        ./modules/programs.nix
        ./modules/users.nix
        ./modules/services.nix
        ./modules/security.nix
        ./modules/packages.nix

        # Home Manager
        ./home/manager.nix
    ];

    # Config somethings
    networking.hostName = "nixos";
    networking.wireless.enable = false;
    networking.networkmanager.enable = true;
    time.timeZone = "Asia/Ho_Chi_Minh";

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";

    # Catppuccin
    catppuccin = {
        enable = true;
        flavor = "mocha";
    };
}