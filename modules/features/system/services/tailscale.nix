{
  libs,
  config,
  ...
}: {
  age.secrets.tailscale.file = libs.root "/assets/secrets/tailscale.secret.age";

  services.tailscale = {
    authKeyFile = config.age.secrets.tailscale.path;
  };
}
