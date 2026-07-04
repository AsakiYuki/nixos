{...}: {
  imports = [
    ./nginx.nix
    ./adguardhome.nix
    ./cloudflare-dyndns.nix
    ./mysql.nix
    ./nginx.nix
    ./openssh.nix
    ./forgejo.nix
    ./searx.nix
    ./fail2ban.nix
    ./httpd.nix
    ./dae.nix
  ];
}
