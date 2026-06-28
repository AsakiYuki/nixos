{...}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [10767];
  };
}
