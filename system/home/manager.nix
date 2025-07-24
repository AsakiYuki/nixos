{ inputs, config, pkgs, ... }:
{
    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "bak";
        
        users.asalinux = ./users/asalinux/config.nix;
    };
}