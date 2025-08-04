{ ... }:
let
    shell = import ../../../../../root/programs/shell.nix {};
in
{
    programs.bash = {
        enable =  true;
        shellAliases = shell.shellAliases // {
            restart-wallpaper  = "pkill hyprpaper; nohup hyprpaper > /dev/null 2>&1 &";
            restart-shell = "pkill quickshell; nohup quickshell > /dev/null 2>&1 &";
            nix-list = "nix-store -q --references /run/current-system/sw";

            nix-code = "code /etc/nixos; exit;";
            ssh-server = "ssh -i /home/asalinux/.ssh/id_ed25519 asalinux@tuonghoa.asakiyuki.com";
        };

        shellOptions = [
            "histappend"
            "checkwinsize"
            "extglob"
            "globstar"
            "checkjobs"
            "autocd"
        ];
        
        initExtra = ''
            function git-push()  {
                git add .
                git commit -m "$1"
                git push
            }

            function git-pull() {
                git fetch origin HEAD
                git pull origin HEAD
            }

            allowed_terms=("xterm-kitty" "xterm-ghostty")

            should_run_tmux=false
            for term in "${"$" + "{allowed_terms[@]" + "}"}"; do
            if [[ "$TERM" == "$term" ]]; then
                should_run_tmux=true
                break
            fi
            done

            if [ -z "$TMUX" ] && [ "$should_run_tmux" = true ]; then
                exec tmux
            fi
        '';
    };
}
