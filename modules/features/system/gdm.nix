{ lib, config, ... }:
{
  services = lib.mkIf config.device.dm.gdm.enable {
    displayManager.gdm.enable = true;
  };
}
