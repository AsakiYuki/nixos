{
  config,
  lib,
  libs,
  pkgs,
  ...
}: let
  rawScript = libs.readRootFile "/scripts/completions/cloudflare.sh";
  finalScript = lib.replaceStrings ["@warpCli@"] ["${pkgs.cloudflare-warp}/bin/warp-cli"] rawScript;
in {
  programs.bash.interactiveShellInit =
    lib.mkIf config.services.cloudflare-warp.enable finalScript;
}
