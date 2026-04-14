{...}: {
  programs.yt-dlp = {
    enable = true;
    extraConfig = ''
      -o ~/Downloads/yt-dlp/%(title)s.%(ext)s
    '';
  };
}
