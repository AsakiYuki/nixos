{...} @ args: rec {
  root = path: ../. + path;
  rootPath = path: "/etc/nixos${path}";
  readFileAtRoot = path: builtins.readFile (root path);
  mkUsers = import ./mkUsers.nix args;
}
