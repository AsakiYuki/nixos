{ ... }:

{
  systemd.services.minecraft-bedrock = {
    description = "Minecraft Bedrock Server";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      User = "asakiyuki";
      WorkingDirectory = "/home/asakiyuki/HOST/bedrockserver";
      ExecStart = "/home/asakiyuki/HOST/bedrockserver/bedrock_server";
      Environment = "LD_LIBRARY_PATH=.";
      Restart = "on-failure";
      RestartSec = "10s";
    };
  };
}
