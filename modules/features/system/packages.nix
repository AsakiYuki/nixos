{
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      git
      vim
      wget
      tree
      screen

      nixd
      alejandra

      p7zip-rar

      kdePackages.kio-extras
      kdePackages.kio-fuse
    ]
    ++ (lib.optional (inputs ? agenix) inputs.agenix.packages.${pkgs.system}.default);
}
