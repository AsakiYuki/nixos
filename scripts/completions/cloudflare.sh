if ! complete -p warp-cli &>/dev/null; then
  if systemctl is-active --quiet cloudflare-warp.service; then
    source <(@warpCli@ generate-completions bash) 2>/dev/null || true
  fi
fi