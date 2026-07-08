{...} @ args: rec {
  root = path: ../. + path;
  rootPath = path: "/etc/nixos${path}";
  readRootFile = path: builtins.readFile (root path);
  readRootFiles = paths: map (path: readRootFile) paths;
  mkUsers = import ./mkUsers.nix args;
}
