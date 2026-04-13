{
  lib,
  osconfig,
  ...
}: {
  programs.bash = {
    enable = true;
    shellAliases = lib.attrsets.mergeAttrsList [
      {
        cls = "clear";
        cleanup = "sudo nix-collect-garbage -d";
        cls-log = "sudo journalctl --vacuum-time=1s";

        logout = "pkill -KILL -u $USER";

        nrs = "sudo nixos-rebuild switch --flake /etc/nixos#${osconfig.device.flake-name}";
        flake-upgrade = "nix flake update";
      }
      {
        spf = "superfile";
      }
      (lib.optionalAttrs osconfig.virtualisation.waydroid.enable {
        wss = "waydroid session stop; exit;";
      })
    ];

    shellOptions = [
      "histappend"
      "checkwinsize"
      "extglob"
      "globstar"
      "checkjobs"
      "autocd"
    ];

    initExtra =
      ''
        function git-commit() {
            git add .
            git commit -m "$1"
        }

        function git-push()  {
            git-commit "$1"
            git push origin HEAD
        }

        function git-pull() {
            git fetch origin HEAD
            git pull origin HEAD
        }

        function get-hash() {
            nix hash to-sri --type sha256 $(nix-prefetch-url --unpack "$1")
        }
      ''
      + lib.optionalString osconfig.device.programs.tmux.enable ''
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
