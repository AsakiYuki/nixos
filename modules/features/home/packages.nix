{
  pkgs,
  lib,
  osconfig,
  ...
}:
{
  home.packages = with pkgs; [
    hyprshot
    antigravity

    (lib.mkIf osconfig.device.programs.cider-2.enable cider-2)
  ];
}
