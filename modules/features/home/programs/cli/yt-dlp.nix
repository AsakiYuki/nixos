{
  config,
  lib,
  ...
}: let
  cfg = config.programs.yt-dlp.output;
in {
  age.secrets.yt-dlp-cookies.file = lib.root "/assets/secrets/services/yt-dlp.cookies.age";

  config.programs.yt-dlp = {
    extraConfig = ''
      -o ${config.home.homeDirectory}/${cfg.directory}/${cfg.format} --cookies
    '';
  };
}
