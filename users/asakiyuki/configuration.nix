{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  asakiyuki = {
    root = {
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [
        (libs.readFileAtRoot "/secrets/ssh/asakiyuki.public.key")
      ];
    };

    home = {
      programs.btop.enable = true;
    };
  };
}
