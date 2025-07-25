{ inputs, config, pkgs, ... }:
{
    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "bak";
        
        users.asalinux = {
            imports = [
                ./users/asalinux/config.nix
                inputs.catppuccin.homeModules.catppuccin
            ];
        };
    };
}