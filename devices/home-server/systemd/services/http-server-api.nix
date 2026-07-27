{pkgs, ...}: let
  bunPkg = pkgs.bun-baseline {};
in {
  systemd.services.http-server-api = {
    description = "ElysiaJS HTTP API Server";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];

    path = [bunPkg];

    serviceConfig = {
      User = "asakiyuki";
      WorkingDirectory = "/mnt/HOST/ServerAPI";

      ExecStart = "${bunPkg}/bin/bun run src/index.ts";

      Restart = "on-failure";
      RestartSec = "10s";
    };
  };
}
