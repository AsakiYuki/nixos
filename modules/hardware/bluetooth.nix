{ config, ... }: {
    hardware.bluetooth.enable = config.device.bluetooth.enable;
}