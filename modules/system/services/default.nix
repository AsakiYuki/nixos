{...}: {
  imports = [
    ./gdm.nix
    ./gnome.nix
    ./kde-plasma.nix
    ./openssh.nix
    ./sddm.nix
    ./envfs.nix
    ./stalwart.nix
    ./tailscale.nix
    ./fail2ban.nix
  ];
}
