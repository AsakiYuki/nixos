{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  junko = {
    root.openssh.authorizedKeys.keys = libs.readRootFiles ((import ./authorizedKeys.nix) ++ (import ../asakiyuki/authorizedKeys.nix));
  };
}
