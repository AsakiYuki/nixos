{
  pkgs,
  custom,
  ...
}: {
  programs.steam = {
    package = pkgs.millennium-steam;
  };

  environment.systemPackages = [
    (pkgs.callPackage custom.wine-discord-ipc-bridge {})
  ];
}
