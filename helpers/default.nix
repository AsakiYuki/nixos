{...} @ args: let
  fs = import ./fileSystem.nix;
  mkAuthKeys = import ./mkAuthorizedKeys.nix;
  mkProgOpt = import ./mkProgramOption.nix args;
  attrs = {
    mkUsers = import ./mkUsers.nix args;
  };
in
  fs // mkAuthKeys // mkProgOpt // attrs
