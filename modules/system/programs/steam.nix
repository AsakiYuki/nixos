{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.steam = {
    package = pkgs.millennium-steam;
  };

  environment.systemPackages = lib.mkIf config.programs.steam.enable [
    pkgs.wine-discord-ipc-bridge
  ];
}
