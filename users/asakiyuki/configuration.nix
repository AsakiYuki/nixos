{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  asakiyuki = {
    root = {
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = libs.readRootFiles [
        "/assets/public/ssh/asakiyuki/nixos/home-server.pub"
        "/assets/public/ssh/asakiyuki/nixos/ideapad.pub"
        "/assets/public/ssh/asakiyuki/nixos/ideapad.wsl.pub"
      ];
    };

    home = {
      programs.btop.enable = true;
    };
  };
}
