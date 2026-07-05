{...}: {
  services.dae = {
    enable = true;
    openFirewall.enable = true;
    configFile = ../configs/dae/proxy.dae;
  };
}
