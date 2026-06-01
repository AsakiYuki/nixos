{
  osconfig,
  config,
  ...
}: {
  imports = [./monitors.nix];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      # --- KEYBIND ---

      terminal = "${osconfig.device.programs.terminal.name}"
      homeDir = "${config.home.homeDirectory}"

      ${builtins.readFile ./bind.lua}
    '';
  };
}
