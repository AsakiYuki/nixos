rec {
  root = path: ../. + path;
  rootPath = path: "/etc/nixos${path}";
  readRootFile = path: builtins.readFile (root path);
  filesMap = paths: containDir: map (path: "${containDir}/${path}") paths;
  readRootFiles = paths: map (path: readRootFile path) paths;
}
