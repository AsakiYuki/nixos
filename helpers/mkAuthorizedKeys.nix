let
  fs = import ./fileSystem.nix;
in {
  mkAuthorizedKeys = paths: prefix: fs.readRootFiles (fs.filesMap paths prefix);
}
