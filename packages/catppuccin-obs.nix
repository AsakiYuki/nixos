{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  pname = "catppuccin-obs";
  version = "main";

  src = pkgs.fetchzip {
    url = "https://static.asakiyuki.com/packages/nixos/catppuccin-obs.zip";
    sha256 = "sha256-Uk4a0HKaeyQilgBiPsuAWQubk1yZdyirNcfhYJEL+lQ=";
  };

  buildCommand = ''
    mkdir -p $out
    cp -r $src/themes/* $out/
  '';
}
