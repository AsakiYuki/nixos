{config, ...}: let
  cfg = config.programs.yt-dlp.output;
in {
  programs.yt-dlp = {
    settings = {
      output = "${config.home.homeDirectory}/${cfg.directory}/${cfg.format}";
    };
  };
}
