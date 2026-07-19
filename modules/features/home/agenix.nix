{
  lib,
  libs,
  config,
  ...
}: {
  age.secrets = let
    mkSecretIf = condition: file: (lib.mkIf condition {file = libs.root file;});
    cfgPg = config.programs;
  in {
    yt-dlp-cookies = mkSecretIf cfgPg.yt-dlp.enable "/assets/secrets/programs/yt-dlp.cookies.age";
  };
}
