{ ... }:
{
    home-manager = {
        users.asalinux = ./users/asalinux/config.nix;
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "bak";
    };
}