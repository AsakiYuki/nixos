paths: let
  fs = import ../libs/fileSystem.nix;
in
  fs.readRootFiles (paths {fs = fs;})
