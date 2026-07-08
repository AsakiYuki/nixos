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
      files.source.".ssh/id_ed25519" = libs.root "/secrets/ssh/asakiyuki.private.key";
      files.source.".ssh/id_ed25519.pub" = libs.root "/secrets/ssh/asakiyuki.public.key";
    };
  };
}
