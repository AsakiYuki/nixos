{ config, ... }:

let theme = import ./settings/theme.nix {}; in
let bind = import ./settings/bind.nix {}; in
let wr = import ./settings/windowrule.nix {}; in
{
  plugin = import ./settings/plugin.nix {}; 
  "exec-once" = import ./settings/exec-once.nix {};
 
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
}
