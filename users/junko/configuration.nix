{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  junko = {
    root.openssh.authorizedKeys.keys = libs.readRootFiles [
      "/assets/public/ssh/asakiyuki/nixos/ideapad.pub"
      "/assets/public/ssh/junko/windows/hp-victus.pub"
    ];
  };
}
