{pkgs, ...}: {
  programs.steam = {
    package = pkgs.millennium-steam;
    gamescopeSession = true;
  };
}
