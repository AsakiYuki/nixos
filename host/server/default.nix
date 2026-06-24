{libs, ...}: {
  imports = [
    ./programs.nix
    ./services.nix
    ./users.nix
    ./ssh.nix

    (libs.root "/modules/programs/minecraft/default.nix")

    (libs.root "/users/asakiyuki/configuration.nix")
    (libs.root "/users/junko/configuration.nix")
  ];
}
