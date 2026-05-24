{
  osconfig,
  lib,
  ...
}:
{
  programs.niri = lib.mkIf (lib.attrByPath [ "device" "wm" "niri" "enable" ] false osconfig) {
    enable = true;
    settings = {
      binds = {
        # "Ctrl+Alt+T" = "ghostty";
        # "Mod+D" = "fuzzel";
      };
    };
  };
}
