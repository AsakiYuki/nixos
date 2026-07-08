{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  junko = {
    root.openssh.authorizedKeys.keys =
      (config.users.users.asakiyuki.openssh.authorizedKeys.keys)
      ++ (libs.readRootFiles [
        "/assets/public/ssh/junko/windows/hp-victus.pub"
      ]);
  };
}
