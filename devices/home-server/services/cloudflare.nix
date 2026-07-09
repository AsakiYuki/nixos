{
  libs,
  config,
  ...
}: {
  age.secrets.cloudflare.file = libs.root "/assets/secrets/cloudflare.secret";

  services = {
    cloudflare-warp.enable = true;

    cloudflare-dyndns = {
      enable = true;
      apiTokenFile = config.age.secrets.cloudflare.paths;
      frequency = "*:0/5";
      proxied = false;
      ipv6 = false;
      ipv4 = true;
      deleteMissing = false;
      domains = [
        "asakiyuki.com"
        "ddns.asakiyuki.com"
        "mx1.asakiyuki.com"
      ];
    };
  };
}
