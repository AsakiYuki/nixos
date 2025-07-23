{ config, pkgs, ... }:

{
  home.username = "asalinux";
  home.homeDirectory = "/home/asalinux";
  home.stateVersion = "25.05";

  programs.kitty.enable = true;
  
  wayland.windowManager.hyprland = import ./hyprland.nix { inherit config pkgs; };
  services.hyprpaper = import ./programs/hyprpaper.nix {};
  home.sessionVariables = import ./env.nix {};
  programs.bash = import ./bash.nix {};
  programs.vscode = import ./programs/vscode.nix { inherit pkgs; }; 
  i18n.inputMethod = import ./programs/inputmethod.nix { inherit pkgs; };
  programs.kitty.extraConfig = import ./programs/kitty.nix {};

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = ["gtk"];
        hyprland.default = ["gtk" "hyprland"];
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };
} 
