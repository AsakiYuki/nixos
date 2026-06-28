{libs, ...}: {
  imports = [
    ./services
    ./security
    ./programs
    ./users.nix

    (libs.root "/modules/programs/minecraft")

    (libs.root "/users/asakiyuki/configuration.nix")
    (libs.root "/users/junko/configuration.nix")
  ];

  virtualisation.docker.enable = true;
}
