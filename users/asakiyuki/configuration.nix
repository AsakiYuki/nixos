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
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEQMWoMdcMNT4ceERAWWVcI7kS6x42Z8BjyYyvJ+rh/B vantrong2007vn@gmail.com" # NixOS
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGffZjMp/DSq302zK+O7qGTVwL5hfe2dHVFTMmi9Cw93 vantrong2007vn@gmail.com" # Windows
      ];
    };

    home = {
      programs.btop.enable = true;
    };
  };
}
