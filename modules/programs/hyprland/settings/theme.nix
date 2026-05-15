{...}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 3;
      gaps_out = 8;
      border_size = 1;
      "col.active_border" = "rgb(cdd6f4)";
      "col.inactive_border" = "rgb(7f849c)";
      allow_tearing = true;
      resize_on_border = true;

      layout = "scrolling";
    };

    decoration = {
      rounding = 13;
      rounding_power = 10;
      active_opacity = 1;
      inactive_opacity = 1;

      blur = {
        enabled = true;
        size = 2;
        passes = 5;
        vibrancy = 3;
      };
    };

    animations = {
      enabled = "yes";

      bezier = [
        "overshot, 0.05, 0.9, 0.1, 1.1"
        "md3_decel, 0.05, 0.7, 0.1, 1"
      ];

      animation = [
        "windows, 1, 3, overshot, popin 60%"
        "border, 1, 10, default"
        "fade, 1, 2, default"
        "workspaces, 1, 3.5, overshot, slidefade 15%"
        "specialWorkspace, 1, 3, md3_decel, slidevert"
      ];
    };

    dwindle = {
      # pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    misc = {
      force_default_wallpaper = 1;
      disable_hyprland_logo = true;
    };
  };
}
