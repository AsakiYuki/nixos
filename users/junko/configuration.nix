{
  libs,
  lib,
  config,
  ...
}:
libs.mkUsers config {
  junko = {
    root.openssh.authorizedKeys.keys =
      (lib.attrByPath ["users" "asakiyuki" "openssh" "authorizedKeys" "keys"] [] config)
      ++ (libs.readRootFiles [
        "/assets/public/ssh/junko/windows/hp-victus.pub"
      ]);
  };
}
