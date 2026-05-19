{...}: {
  wayland.windowManager.hyprland.settings = {
    "$LAPTOP_TOUCHPAD_ENABLE" = false;

    device = {
      name = "gxtp5100:00-27c6:01e0-touchpad";
      enabled = "$LAPTOP_TOUCHPAD_ENABLE";
      natural_scroll = true;
    };

    misc = {
      middle_click_paste = false;
    };

    input = {
      touchpad.natural_scroll = true;
      touchpad.disable_while_typing = true;
      accel_profile = "flat";
      sensitivity = 1.0;
    };
  };
}
