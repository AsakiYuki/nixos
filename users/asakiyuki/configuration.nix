{
  inputs,
  libs,
  config,
  custom,
  unstable,
  ...
}: let
  osconfig = config;
in
  libs.mkUsers {
    asakiyuki = {
      root.extraGroups = ["wheel"];
      home = {
        _module.args = {
          inherit osconfig;
        };

        imports = [
          ./programs.nix
          ../../modules/features/home/theme.nix
        ];
      };
    };
  }
