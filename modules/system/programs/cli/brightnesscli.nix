{
  config,
  lib,
  ...
}: {
  programs.bash.interactiveShellInit = lib.mkIf config.programs.brightnessctl.enable (lib.readRootFile "/scripts/shell/completions/brightnessctl.sh");
}
