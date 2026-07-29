{
  lib,
  libs,
  config,
  osconfig,
  ...
}: {
  programs.bash = {
    shellAliases = lib.attrsets.mergeAttrsList (
      let
        attOpt = condition: key: value: (lib.optionalAttrs condition {
          "${key}" = value;
        });
      in [
        {
          cls = "clear";
          cleanup = "sudo nix-collect-garbage -d";
          cls-log = "sudo journalctl --vacuum-time=1s";

          logout = "pkill -KILL -u $USER";

          nrs = "sudo nixos-rebuild switch --flake /etc/nixos#${osconfig.device.flake-name} --option warn-dirty false";
          flake-upgrade = "nix flake update";
        }
        (attOpt config.programs.superfile.enable "spf" "superfile")
        (attOpt osconfig.virtualisation.waydroid.enable "wss" "waydroid session stop; exit;")
      ]
    );

    shellOptions = [
      "histappend"
      "checkwinsize"
      "extglob"
      "globstar"
      "checkjobs"
      "autocd"
    ];

    initExtra = let
      strOpt = condition: filePath: (lib.optionalString condition (libs.readRootFile filePath));
      cfg = config.programs;
    in ''
      ${libs.readRootFile "/scripts/bash.sh"}
      ${libs.readRootFile "/scripts/truonglon.sh"}
      ${strOpt cfg.qpdf.enable "/scripts/qpdf.sh"}
      ${strOpt cfg.tmux.enable "/scripts/tmux.sh"}
    '';
  };
}
