{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.steam = {
    package = pkgs.millennium-steam;
  };
}
