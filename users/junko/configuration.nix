{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  junko = {
    root.openssh.authorizedKeys.keys = (import ./authorizedKeys.nix) ++ (import ../asakiyuki/authorizedKeys.nix);
  };
}
