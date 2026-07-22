{libs, ...}: {
  imports = [
    ./programs
    ./services

    (libs.root "/users/asakiyuki/configuration.nix")
  ];

  virtualisation.docker.enable = true;
}
