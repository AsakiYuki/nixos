{ inputs, pkgs, unstable, ... }:
{
    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "bak";
        
        users.asalinux = {
             _module.args = {
                inputs = inputs;
                unstable = unstable;
            };

            imports = [
                inputs.catppuccin.homeModules.catppuccin
                inputs.zen-browser.homeModules.beta
                inputs.nixvim.homeModules.nixvim
                ./users/asalinux/config.nix
            ];
        };
    };
}
