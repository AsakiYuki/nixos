{
  lib,
  libs,
  inputs,
  pkgs,
  ...
}:
lib.mkIf (inputs ? agenix) {
  imports = [inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default];
  programs.bash.interactiveShellInit = libs.readRootFile "/scripts/completions/agenix.sh";
}
