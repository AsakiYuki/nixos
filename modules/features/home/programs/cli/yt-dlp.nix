{
  config,
  libs,
  ...
}: let
  cfg = config.programs.yt-dlp.output;
in {
  age.secrets.yt-dlp-cookies.file = libs.root "/assets/secrets/services/yt-dlp.cookies.age";
  programs.yt-dlp = {
    extraConfig = ''
      -o ${config.home.homeDirectory}/${cfg.directory}/${cfg.format} --cookies ${config.age.secrets.yt-dlp-cookies.path}
    '';
  };
}
