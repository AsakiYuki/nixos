{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "QT_IM_MODULE=none quickshell"
    "fcitx5"
    "easyeffects -w"
  ];
}
