{ pkgs, ... }:
{
  enable = true;
  package = pkgs.vscode;
  # profiles.default.extensions = with pkgs.vscode-extension; [];
}
