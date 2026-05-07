{
  osconfig,
  lib,
  ...
}: {
  programs.steam.millennium = lib.mkIf osconfig.programs.steam.millennium.enable {
    plugins = {
      extendium.enable = true;
      steamhunter-plugin.enable = true;
      aacla.enable = true;
      steam-non-steam-playtimes.enable = true;
      steam-size-on-disk.enable = true;
      valve-internal-enabler.enable = true;
    };
  };
}
