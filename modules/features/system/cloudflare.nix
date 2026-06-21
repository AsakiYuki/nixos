{
  pkgs,
  config,
  lib,
  ...
}: {
  services.cloudflare-warp.enable = true;
  programs.bash.interactiveShellInit = lib.mkIf config.services.cloudflare-warp.enable ''
    if ! complete -p warp-cli &>/dev/null; then
      if systemctl is-active --quiet cloudflare-warp.service; then
        source <(${pkgs.cloudflare-warp}/bin/warp-cli generate-completions bash) 2>/dev/null || true
      fi
    fi
  '';
}
