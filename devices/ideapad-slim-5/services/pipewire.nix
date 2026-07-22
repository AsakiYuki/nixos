{pkgs, ...}: {
  services.pipewire.wireplumber.extraConfig = {
    "50-disable-dmic" = {
      "monitor.alsa.rules" = [
        {
          matches = [{"node.name" = "~alsa_input.*Mic1.*";}];
          actions.update-props = {
            "node.disabled" = true;
          };
        }
      ];
    };

    "51-force-mic2-plugged" = {
      "monitor.alsa.rules" = [
        {
          matches = [
            {"node.name" = "~alsa_input.*Mic2.*";}
          ];
          actions.update-props = {
            "node.description" = "Internal Microphone";
            "device.icon-name" = "audio-input-microphone";
            "card.profile.device" = "0";
            "priority.driver" = 9999;
            "priority.session" = 9999;
            "api.alsa.use-acp" = true;
          };
        }
      ];
    };
  };

  systemd.services.unmute-mic = {
    description = "Unmute Analog Microphone on Boot";
    wantedBy = ["multi-user.target"];
    after = ["sound.target"];
    script = ''
      ${pkgs.alsa-utils}/bin/amixer -c 1 set Capture cap || true
      ${pkgs.alsa-utils}/bin/amixer -c 1 set Capture 100% || true
      ${pkgs.alsa-utils}/bin/amixer -c 1 set 'Internal Mic Boost' 1 || true
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
