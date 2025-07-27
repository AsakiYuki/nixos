{ ... }:
{
    shellAliases = {
        cls = "clear";
        ff = "fastfetch";
        btw = "echo i use nixos, btw";
        nrs = "sudo nixos-rebuild switch";
    };

    shellInit = ''
        function git-push()  {
            git add .
            git commit -m "$1"
            git push
        }

        function git-pull() {
            git fetch origin HEAD
            git pull origin HEAD
        }

        if [ "$TERM_PROGRAM" != "vscode" ]; then
            if ! pgrep ssh-agent >/dev/null; then
                eval "$(ssh-agent -s)"
                ssh-add ~/.ssh/id_ed25519 2>/dev/null
            fi
        fi
    '';
}