{
  osconfig,
  config,
  ...
}: {
  imports = [./monitors.nix];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      -- KEYBIND
      local terminal = "${osconfig.device.programs.terminal.name}"
      local homeDir = "${config.home.homeDirectory}"
      local fileManager = "dolphin"
      ${builtins.readFile ./bind.lua}

      -- WINDOW RULES
      ${builtins.readFile ./window-rules.lua}

      -- AUTOSTART
      ${builtins.readFile ./autostart.lua}

      -- INPUTS
      ${builtins.readFile ./inputs.lua}

      -- THEME
      ${builtins.readFile ./theme.lua}
    '';
  };
}
