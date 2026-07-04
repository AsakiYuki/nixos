{
  lib,
  config,
  ...
}: {
  services = lib.mkIf config.device.de.kdePlasma.enable {
    desktopManager.plasma6.enable = true;
    xserver.enable = true;
  };
}
