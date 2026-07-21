{pkgs, ...}: {
  environment.systemPackages = [pkgs.xvfb-run];
  systemd.services.cider-2-api = {
    enable = true;
    description = "Cider 2 Headless Service for API";
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      User = "asakiyuki";
      ExecStart = "${pkgs.xvfb-run}/bin/xvfb-run -a /etc/profiles/per-user/asakiyuki/bin/cider-2 --remote-debugging-port=9222 --no-sandbox --disable-gpu --disable-software-rasterizer";
      Restart = "always";
      RestartSec = "10s";
    };
  };
}
