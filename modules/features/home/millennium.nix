{
  osconfig,
  lib,
  ...
}: {
  programs.steam.millennium = lib.mkIf osconfig.programs.steam.millennium.enable {
    plugins = {
      extendium.enable = true;
    };
  };
}
