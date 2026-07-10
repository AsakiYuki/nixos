{libs, ...}: {
  imports = [
    (libs.root "/users/asakiyuki/configuration.nix")

    ./programs
    ./security
    ./services

    ./wsl.nix
  ];
}
