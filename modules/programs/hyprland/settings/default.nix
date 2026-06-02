{
  osconfig,
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    extraConfig = ''
      -- KEYBIND
      local terminal = "${osconfig.device.programs.terminal.name}"
      local homeDir = "${config.home.homeDirectory}"
      local fileManager = "dolphin"
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

      -- OS EXTRA CONFIGS
      ${lib.attrByPath ["device" "wm" "hyprland" "extraConfig"] "" osconfig}
    '';
  };
}
