rec {
  root = path: ../. + path;
  rootString = path: "${toString ../.}${path}";
  rootPath = path: "/etc/nixos${path}";
  readRootFile = path: builtins.readFile (root path);
  filesMap = paths: prefix: map (path: "${prefix}/${path}") paths;
  readRootFiles = paths: map (path: readRootFile path) paths;
}
