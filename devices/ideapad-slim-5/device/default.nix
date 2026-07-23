{libs, ...}: {
  device.wm.hyprland.extraConfig = ''
    TouchpadName = "gxtp5100:00-27c6:01e0-touchpad"

    local HDRIccProfile = "${libs.root "/assets/colors/srgb_to_gamma2p2_400_mhc2.icm"}"
    local DCIP3IccProfile = "${libs.root "/assets/colors/DCI-P3-DCI.icc"}"
    ${builtins.readFile ./monitors.lua}
  '';
}
