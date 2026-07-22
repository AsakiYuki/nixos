{...}: {
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
}
