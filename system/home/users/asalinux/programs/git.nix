{ ... }:
let
    git = import ../../../../../root/programs/git.nix {};
in
{
    programs.git = {
        enable = git.enable;
        lfs.enable = git.lfs.enable;
        extraConfig = git.config;
    };
}