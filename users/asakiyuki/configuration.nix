{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  asakiyuki = {
    root.extraGroups = ["wheel"];
    home = {};
  };
}
