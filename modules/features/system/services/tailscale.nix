{libs, ...}: {
  services.tailscale = {
    authKeyFile = libs.root "/secrets/tailscale.secret";
  };
}
