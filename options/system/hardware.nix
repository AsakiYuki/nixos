{lib, ...}: {
  options.device = {
    bluetooth.enable = lib.mkEnableOption "bluetooth";
  };
}
