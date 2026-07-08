{pkgs, ...}: {
  imports = [
    ./openssh.nix
  ];

  security.rtkit.enable = true;

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
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      # Disable broken DMIC (acp-pdm-mach), use analog Stereo Mic instead
      wireplumber.extraConfig."50-disable-dmic" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              {"node.name" = "alsa_input.pci-0000_05_00.6.HiFi__Mic1__source";}
            ];
            actions.update-props = {
              "node.disabled" = true;
            };
          }
        ];
      };
    };
  };

  home-manager.users.asakiyuki.services = {
    hyprpolkitagent.enable = true;
  };
}
