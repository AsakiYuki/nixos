{libs, ...}: {
  imports = [
    (libs.root "/modules/features/system/forgejo.nix")
    (libs.root "/modules/services/adguardhome.nix")
    (libs.root "/modules/services/cloudflare-dyndns.nix")
    (libs.root "/modules/services/fail2ban.nix")
    (libs.root "/modules/services/openssh.nix")
    (libs.root "/modules/services/httpd.nix")
  ];

  services.logrotate = {
    enable = true;
    checkConfig = false;
  };
}
