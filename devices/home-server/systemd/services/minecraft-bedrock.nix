{pkgs, ...}: {
  systemd.services.minecraft-bedrock = {
    description = "Minecraft Bedrock Server";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];

    serviceConfig = {
      Type = "forking";
      User = "hieze";
      Group = "mc-bedrock";
      WorkingDirectory = "/mnt/HOST/bedrockserver";
      Environment = [
        "LD_LIBRARY_PATH=."
      ];

      ExecStart = "${pkgs.screen}/bin/screen -dmS mc-bedrock ./bedrock_server";
      ExecStop = "${pkgs.screen}/bin/screen -S mc-bedrock -X stuff 'stop^M'";

      Restart = "on-failure";
      RestartSec = "10s";
    };
  };
}
