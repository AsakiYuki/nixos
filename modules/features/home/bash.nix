{
  lib,
  libs,
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
      (builtins.readFile (libs.root "/scripts/bash.sh"))
      + lib.optionalString
      osconfig.device.programs.tmux.enable (builtins.readFile (libs.root "/scripts/tmux.sh"));
  };
}
