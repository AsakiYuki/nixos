{
  lib,
  config,
  ...
}: {
  services.flatpak = lib.mkIf config.device.flatpak.enable {
    enable = true;
  };
}
