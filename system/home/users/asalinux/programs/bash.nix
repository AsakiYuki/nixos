{ ... }:
let
    shell = import ../../../../../root/programs/shell.nix {};
in
{
    enable =  true;
    shellAliases = shell.shellAliases // {
        restart-wallpaper  = "pkill hyprpaper; nohup hyprpaper > /dev/null 2>&1 &";
        restart-shell = "pkill quickshell; nohup quickshell > /dev/null 2>&1 &";
        nix-list = "nix-store -q --references /run/current-system/sw";
    };
    
    initExtra = (shell.shellInit + ''
    
    '');
}
