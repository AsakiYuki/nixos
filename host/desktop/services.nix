{ libs, ... }:
{
  imports = [
    (libs.root /modules/services/mysql.nix)
  ];
}
