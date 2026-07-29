{
  config,
  lib,
  libs,
  ...
}: {
  programs.bash.interactiveShellInit = lib.mkIf config.programs.brightnessctl.enable (libs.readRootFile "/scripts/completions/brightnessctl.sh");
}
