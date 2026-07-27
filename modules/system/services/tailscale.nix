{
  lib,
  config,
  unstable,
  ...
}:
lib.mkIf config.services.tailscale.enable {
  services.tailscale = {
    authKeyFile = config.age.secrets.tailscale.path;
    package = unstable.tailscale;
  };
}
