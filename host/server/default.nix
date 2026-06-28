{libs, ...}: {
  imports = [
    ./services

    ./programs.nix
    ./users.nix
    ./ssh.nix

    (libs.root "/modules/programs/minecraft")

    (libs.root "/users/asakiyuki/configuration.nix")
    (libs.root "/users/junko/configuration.nix")
  ];
}
