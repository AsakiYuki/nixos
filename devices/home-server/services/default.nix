{...}: {
  imports = [
    ./nginx.nix
    ./adguardhome.nix
    ./cloudflare-dyndns.nix
    ./mysql.nix
    ./nginx.nix
    ./openssh.nix
    ./forgejo.nix
  ];

  services.fail2ban.enable = true;
}
