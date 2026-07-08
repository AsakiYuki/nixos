{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  junko = {
    root.openssh.authorizedKeys.keys = [
      (libs.readFileAtRoot "/secrets/ssh/asakiyuki.public.key")
      (libs.readFileAtRoot "/secrets/ssh/junko.public.key")
    ];
  };
}
