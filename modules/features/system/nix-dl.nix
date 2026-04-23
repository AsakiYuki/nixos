{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      brotli
      unixODBC
      zstd
      glib
      stdenv.cc.cc.lib

      pkgsi686Linux.stdenv.cc.cc
      pkgsi686Linux.zlib
      pkgsi686Linux.glib
      pkgsi686Linux.zstd
    ];
  };
}
