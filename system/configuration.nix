{ inputs, nixpkgs, pkgs, unstable, home-manager, ... }:
{
    # Import nix
    imports = [
        # Extension
        home-manager.nixosModules.default
        inputs.spicetify-nix.nixosModules.default
        
        # Require
        ./modules/hardware.nix

        # Modules
        ./modules/boot.nix
        ./modules/programs.nix
        ./modules/users.nix
        ./modules/services.nix
        ./modules/security.nix
        ./modules/packages.nix
        ./modules/fonts.nix
        ./modules/networking.nix

        # Home Manager
        ./home/manager.nix
    ];

    # Config somethings
    time.timeZone = "Asia/Ho_Chi_Minh";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
    xdg.menus.enable = true;
    xdg.mime.enable = true;

    system.stateVersion = "25.05";
}
