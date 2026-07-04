{config, ...}: {
  programs.yt-dlp = {
    enable = true;
    extraConfig = ''
      -o ${config.home.homeDirectory}/Downloads/yt-dlp/%(title)s.%(ext)s
    '';
  };
}
