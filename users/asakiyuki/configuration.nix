{
  lib,
  libs,
  config,
  ...
}:
lib.mergeAttrs {
  age.secrets.asakiyukipwd.file = libs.root "/assets/secrets/users/asakiyuki.pwd.sha256.age";
}
(
  libs.mkUsers config {
    asakiyuki = {
      root = {
        extraGroups = ["wheel"];
        hashedPasswordFile = config.age.secrets.asakiyukipwd.path;
      };

      home = {
        programs.btop.enable = true;
      };
    };
  }
)
