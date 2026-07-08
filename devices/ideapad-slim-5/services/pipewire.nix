{pkgs, ...}: {
  services.pipewire.wireplumber.extraConfig = {
    "50-disable-dmic" = {
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

    "50-default-source" = {
      "monitor.alsa.rules" = [
        {
          matches = [
            {"node.name" = "alsa_input.pci-0000_05_00.6.HiFi__Mic2__source";}
          ];
          actions.update-props = {
            "priority.session" = 3000;
          };
        }
      ];
    };
  };

  systemd.services.unmute-mic = {
    description = "Unmute Analog Microphone on Boot";
    wantedBy = [ "multi-user.target" ];
    after = [ "sound.target" ];
    script = ''
      ${pkgs.alsa-utils}/bin/amixer -c 1 set Capture cap || true
      ${pkgs.alsa-utils}/bin/amixer -c 1 set Capture 80% || true
      ${pkgs.alsa-utils}/bin/amixer -c 1 set 'Internal Mic Boost' 1 || true
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
