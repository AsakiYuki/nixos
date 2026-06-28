{libs, ...}: {
  imports = [
    ./services

    ./programs
    ./users.nix
    ./acme.nix

    (libs.root "/modules/programs/minecraft")

    (libs.root "/users/asakiyuki/configuration.nix")
    (libs.root "/users/junko/configuration.nix")
  ];
}
