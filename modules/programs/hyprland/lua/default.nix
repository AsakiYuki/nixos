{
  osconfig,
  lib,
  ...
}: let
  files = ["hyprland.lua"];
in {
  home.file = {
    ".config/hypr/hyprland.lua".source = lib.file.mkOutOfStoreSymlink ./hyprland.lua;
  };
}
