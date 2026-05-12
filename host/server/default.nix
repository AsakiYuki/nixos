{libs, ...}: {
  imports = [
    ./device.nix
    ./programs.nix
    ./services.nix
    ./networking.nix
    ./users.nix
    ./ssh.nix

    (libs.root "/modules/features/system/docker.nix")
    (libs.root "/modules/features/system/packages.nix")
    (libs.root "/modules/features/system/nix-dl.nix")
    (libs.root "/modules/features/system/stalwart.nix")

    (libs.root "/users/asakiyuki/configuration.nix")
    (libs.root "/users/junko/configuration.nix")

    (libs.root "/options/system/default.nix")
    (libs.root "/overlays/nixpkgs.nix")
  ];
}
