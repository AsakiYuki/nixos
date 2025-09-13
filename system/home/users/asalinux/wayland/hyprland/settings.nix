{ config, ... }:
let 
	theme = import ./settings/theme.nix {};
	bind = import ./settings/bind.nix {}; 
	wr = import ./settings/windowrule.nix {};
    monitors = import ./settings/monitors.nix {};
in
{
    plugin = import ./settings/plugin.nix {}; 
    exec-once = import ./settings/exec-once.nix {};
    monitor = monitors.monitor;
  
    # bind.nix
    bind = bind.bind;
    bindm = bind.bindm;
    
    # windowrule.nix
    windowrule = wr.windowrule;
    windowrulev2 = wr.windowrulev2;

    # theme.nix
    general = theme.general;
    decoration = theme.decoration;
    animations = theme.animations;
    dwindle = theme.dwindle;
    master = theme.master;
    misc = theme.misc;

    # idk
    xwayland = {
        force_zero_scaling = true;
    };

    "$LAPTOP_TOUCHPAD_ENABLE" = false;
    device = {
        name = "gxtp5100:00-27c6:01e0-touchpad";
        enabled = "$LAPTOP_TOUCHPAD_ENABLE";
        natural_scroll = true;
    };
}
