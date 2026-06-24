{
  libs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./network.nix
    ./boot.nix
    (libs.root "/host/server/default.nix")
  ];

  users.users.root.shell = lib.mkForce pkgs.bashInteractive;
}
