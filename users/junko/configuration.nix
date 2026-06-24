{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  root = {
    openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEQMWoMdcMNT4ceERAWWVcI7kS6x42Z8BjyYyvJ+rh/B vantrong2007vn@gmail.com"];
    isNormalUser = true;
  };
}
