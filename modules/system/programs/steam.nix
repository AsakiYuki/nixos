{
  pkgs,
  custom,
  lib,
  config,
  ...
}: {
  programs.steam = {
    package = pkgs.millennium-steam;
  };

  environment.systemPackages = lib.mkIf config.programs.steam.enable [
    (pkgs.callPackage custom.wine-discord-ipc-bridge {})
  ];
}
