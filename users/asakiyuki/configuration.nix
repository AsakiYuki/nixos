{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  asakiyuki = {
    root = {
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = import ./authorizedKeys.nix;
    };

    home = {
      programs.btop.enable = true;
    };
  };
}
