{
  libs,
  config,
  ...
}:
(libs.mkUsers config {
  asakiyuki = {
    root = {
      extraGroups = [ "wheel" ];
      hashedPasswordFile = config.age.secrets.asakiyukipwd.path;
    };

    home = {
      programs.btop.enable = true;
    };
  };
})
