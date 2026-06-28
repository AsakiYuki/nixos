{pkgs, ...}: {
  imports = [
    ./openssh.nix
  ];

  services = {
    fail2ban.enable = true;
    flatpak.enable = true;
    displayManager.sddm.enable = true;
    cloudflare-warp.enable = true;
    udisks2.enable = true;
    upower.enable = true;

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  home-manager.users.asakiyuki.services = {
    hyprpolkitagent.enable = true;
  };
}
