{
  config,
  lib,
  libs,
  ...
}: {
  services.cloudflare-warp.enable = true;
  programs.bash.interactiveShellInit =
    lib.mkIf config.services.cloudflare-warp.enable
    (builtins.readFile (libs.root "/scripts/completions/cloudflare.sh"));
}
