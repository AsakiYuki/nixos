{
  lib,
  config,
  ...
}: {
  home = {
    packages = [
      (lib.mkIf config.programs.dolphin.enable config.programs.dolphin.package)
    ];

    file.".config/dolphinrc" = {
      text = "";
      force = true;
    };
  };
}
