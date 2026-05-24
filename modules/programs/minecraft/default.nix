{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers.vanilla = {
      enable = true;
      jvmOpts = "-Xmx4G -Xms2G";
      package = pkgs.minecraftServers.vanilla;

      serverProperties = {
        server-port = 25565;
        difficulty = 2;
        gamemode = 0;
        max-players = 5;
        motd = "Welcome to NixOS Minecraft server!";
      };
    };
  };
}
