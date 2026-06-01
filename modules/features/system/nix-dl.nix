{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      brotli
      unixodbc
      zstd
      glib
      stdenv.cc.cc.lib
    ];
  };
}
