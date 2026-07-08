{...}: {
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
}
