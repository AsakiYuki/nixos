{ libs, ... }:
{
  imports = [
    (libs.root "/modules/services/adguardhome.nix")
    (libs.root "/modules/services/cloudflare-dyndns.nix")
    (libs.root "/modules/services/fail2ban.nix")
    (libs.root "/modules/services/openssh.nix")
  ];
}
