{pkgs, libs, lib, ...}: {
  imports = [
    (libs.root "/users/asakiyuki/configuration.nix")
    
    ./programs
    ./security
    ./services
  ];
}