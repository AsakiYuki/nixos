{
  lib,
  libs,
  config,
  ...
}: lib.mkIf config.services.tailscale.enable {
  age.secrets.tailscale.file = libs.root "/assets/secrets/services/tailscale.secret.age";

  services.tailscale = {
    authKeyFile = config.age.secrets.tailscale.path;
  };
}
