{
  config,
  lib,
  ...
}: {
  programs.bash.interactiveShellInit = lib.mkIf config.programs.brightnessctl.enable (lib.readRootFile "/scripts/bash/completions/brightnessctl.sh");
}
