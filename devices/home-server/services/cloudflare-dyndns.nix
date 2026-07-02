{...}: {
  services.cloudflare-dyndns = {
    enable = true;
    apiTokenFile = "/secrets/cloudflare.secret";
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
}
