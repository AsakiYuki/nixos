{...}: {
  programs = {
    starship.enable = true;
    yt-dlp = {
      enable = true;
      output.directory = "PUBLIC/yt-dlp";
    };
  };
}
