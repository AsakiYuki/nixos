{...}: {
  networking = {
    hostName = "nixos";
    firewall.enable = true;
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [10767];
  };
}
