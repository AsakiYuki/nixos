{ ... }:
[
    "quickshell"
    "hyprpaper"
    "fcitx5"
    "xwaylandvideobridge"
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

    # Services
    "systemctl --user restart xdg-desktop-portal{,-hyprland}"
    "systemctl --user restart pipewire"
    "systemctl --user restart wireplumber"
    "systemctl --user restart xdg-desktop-portal"
]
