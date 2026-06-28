{libs, ...}: {
  imports = [
    ./programs
    ./services
    ./users.nix

    (libs.root "/modules/programs/minecraft")

    (libs.root "/users/asakiyuki/configuration.nix")
    (libs.root "/users/junko/configuration.nix")
  ];

  virtualisation.docker.enable = true;
}
