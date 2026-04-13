{libs, ...}: {
  imports = [
    ./device.nix
    ./programs.nix
    ./services.nix
    ./networking.nix

    (libs.root "/modules/features/system/docker.nix")
    (libs.root "/modules/features/system/packages.nix")
    (libs.root "/modules/features/system/nix-dl.nix")

    (libs.root "/home/asakiyuki/configuration.nix")
    (libs.root "/home/junko/configuration.nix")

    (libs.root "/options/system/default.nix")
    (libs.root "/overlays/nixpkgs.nix")
  ];
}
