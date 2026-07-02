{...}: {
  services.cloudflare-dyndns = {
    enable = true;
    apiTokenFile = "/home/asakiyuki/SECRET/CLOUDFLARE_TOKEN_KEY.txt.";
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
