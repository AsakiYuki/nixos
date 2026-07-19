{
  lib,
  libs,
  config,
  ...
}: {
  age.secrets = let
    mkSecretIf = condition: file: extraOpts: (lib.mkIf condition ({file = libs.root file;} // extraOpts));
    cfgPg = config.programs;
  in {
  };
}
