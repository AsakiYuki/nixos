{
  lib,
  libs,
  inputs,
  pkgs,
  ...
}:
lib.mkIf (inputs ? agenix) {
  environment.systemPackages = [inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default];
  programs.bash.interactiveShellInit = libs.readRootFile "/scripts/completions/agenix.sh";
}
