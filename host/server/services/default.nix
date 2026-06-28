{...}: {
  imports = [
    ./nginx.nix
  ];

  services.fail2ban.enable = true;
}
