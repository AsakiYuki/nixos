{libs, ...}: {
  device.wm.hyprland.extraConfig = ''
    TouchpadName = "gxtp5100:00-27c6:01e0-touchpad"

    local IccProfile = "${libs.root "/assets/colors/srgb_to_gamma2p2_400_mhc2.icm"}"
    ${builtins.readFile ./monitors.lua}
  '';
}
