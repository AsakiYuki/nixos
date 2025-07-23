{ pkgs, ... }:
{
    users.users = {
        asalinux = {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
            packages = with pkgs; [ tree ];
        };
    };
}