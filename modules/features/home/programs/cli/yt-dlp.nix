{config, ...}: let
  cfg = config.programs.yt-dlp.output;
in {
  programs.yt-dlp = {
    extraConfig = ''
      -o ${config.home.homeDirectory}/${cfg.directory}/${cfg.format} --cookies ${config.age.secrets.yt-dlp-cookies.path}
    '';
  };
}
