paths: let
  fs = import ../libs/fileSystem.nix;
in
  fs.readRootFiles (fs.filesMap (paths {fs = fs;}) "/assets/public/ssh")
