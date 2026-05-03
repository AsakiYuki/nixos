{
  custom,
  lib,
  ...
}: {
  programs = {
    ffmpeg.enable = true;
    nodejs.enable = true;
    ntfs3g.enable = true;
    python.enable = true;
    jdk.enable = true;
    bun = {
      enable = true;
      package = lib.callPackages custom.bun {};
    };
  };
}
