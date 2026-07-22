{
  config,
  lib,
  libs,
  ...
}: {
  programs.bash.interactiveShellInit = lib.mkIf config.programs.brightnessctl.enable (builtins.readFile (libs.root "/scripts/completions/brightnessctl.sh"));
}
