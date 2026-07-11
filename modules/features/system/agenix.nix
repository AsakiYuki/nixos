{
  libs,
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default];
  programs.bash.interactiveShellInit = libs.readRootFile "/scripts/completions/agenix.sh";
}
