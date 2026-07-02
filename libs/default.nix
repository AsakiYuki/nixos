{...} @ args: {
  root = path: ../. + path;
  rootPath = path: "/etc/nixos${path}";
  mkUsers = import ./mkUsers.nix args;
}
