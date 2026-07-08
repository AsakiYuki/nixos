{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.steam = lib.mkIf (inputs ? millennium) {
    package = pkgs.millennium-steam;
  };
}
