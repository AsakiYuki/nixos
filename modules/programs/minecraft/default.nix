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
    };
  };
}
