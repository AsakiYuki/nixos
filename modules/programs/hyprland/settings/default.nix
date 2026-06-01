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

      -- THEME
      ${builtins.readFile ./theme.lua}
    '';
  };
}
