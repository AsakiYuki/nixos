{...}: {
  imports = [
    ./programs
    ./services
    ./boot.nix
    ./dconf.nix
    ./input-method.nix
    ./packages.nix
    ./waydroid.nix
  ];
}
