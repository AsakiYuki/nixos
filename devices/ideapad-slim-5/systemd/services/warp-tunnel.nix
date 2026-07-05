{pkgs, ...}: {
  systemd.user.services.warp-tunnel = {
    description = "SSH tunnel to home server WARP proxy";
    wantedBy = ["default.target"];
    after = ["network-online.target"];
    wants = ["network-online.target"];
    serviceConfig = {
      ExecStart = "${pkgs.openssh}/bin/ssh -N -o ServerAliveInterval=30 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -L 1080:127.0.0.1:1080 asakiyuki@asakiyuki.com -p 15523";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
