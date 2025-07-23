{ ... }:
let
    shellAliases = import ../../../../../root/shellAliases.nix {};
in
{
    enable =  true;
    shellAliases = shellAliases // {
        restart-shell = "pkill quickshell; nohup quickshell > /dev/null 2>&1 &";
        nix-list = "nix-store -q --references /run/current-system/sw";
    };
}
