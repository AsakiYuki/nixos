{ inputs, pkgs, ... }:
{
    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "bak";
        
        users.asalinux = {
            imports = [
                inputs.catppuccin.homeModules.catppuccin
                inputs.zen-browser.homeModules.beta
                inputs.nixvim.homeModules.nixvim
                ./users/asalinux/config.nix
            ];
        };
    };
}
