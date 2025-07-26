{ ... }:
let
    git = import ../../../../../root/programs/git.nix {};
in
{
    enable = git.enable;
    lfs.enable = git.lfs.enable;
    extraConfig = git.config;
}