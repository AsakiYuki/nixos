{
  osconfig,
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    extraConfig = ''
      -- Global Variables
      TouchpadName = nil

      -- Local Variables
      local terminal = "${osconfig.device.programs.terminal.name}"
      local homeDir = "${config.home.homeDirectory}"
      local fileManager = "dolphin"

      -- SOME DUMB SHIT UTILS FOR LUA
      ${builtins.readFile ./utils.lua}

       -- OS EXTRA CONFIGS
      ${lib.attrByPath ["device" "wm" "hyprland" "extraConfig"] "" osconfig}

      -- GENERAL HYPRLAND CONFIGURATIONS
      ${builtins.readFile ./hyprland.lua}

      -- KEYBIND
      ${builtins.readFile ./keybind.lua}

      -- WINDOW RULES
      ${builtins.readFile ./window-rules.lua}

      -- WORKSPACES RULES
      ${builtins.readFile ./workspace-rules.lua}

      -- AUTOSTART
      ${builtins.readFile ./autostart.lua}

      -- INPUTS
      ${builtins.readFile ./inputs.lua}

      -- THEME
      ${builtins.readFile ./theme.lua}
    '';
  };
}
