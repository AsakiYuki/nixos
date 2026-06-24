{
  libs,
  config,
  ...
}:
libs.mkUsers config {
  asakiyuki = {
    root.extraGroups = ["wheel"];
    home = {
      imports = [
        ./programs.nix
        ../../modules/features/home/theme.nix
      ];
    };
  };
}
