{
  custom,
  pkgs,
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
      package = pkgs.callPackage custom.bun {};
    };
  };

  home-manager.users.asakiyuki.programs = {
    yt-dlp = {
      enable = true;
      output.directory = "PUBLIC/yt-dlp";
    };
  };
}
