{lib, ...}: let
  files = [
    ./general.lua
    ./media.lua
    ./window.lua
    ./workspace.lua
  ];
in
  lib.strings.join "\n" (map (file: builtins.readFile file) files)
