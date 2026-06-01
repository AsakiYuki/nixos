{ ... }:
{
  wayland.windowManager.hyprland.settings."hyprland.start" = ''
    function ()
      hl.exec_cmd("quickshell")
      hl.exec_cmd("fcitx5")
      hl.exec_cmd("easyeffects -w")
    end
  '';
  # wayland.windowManager.hyprland.settings.exec-once = [
  #  "quickshell"
  #  "fcitx5"
  #  "easyeffects -w"
  #];
}
