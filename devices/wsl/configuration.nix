{lib, ...}: {
  imports = [
    (lib.root "/users/asakiyuki/configuration.nix")

    ./programs
    ./security
    ./services

    ./wsl.nix
  ];
}
