{
  lib,
  config,
  ...
}: {
  age.secrets = let
    mkSecretIf = condition: file: extraOpts: (lib.mkIf condition ({file = lib.root file;} // extraOpts));
    cfgPg = config.programs;
  in {
  };
}
