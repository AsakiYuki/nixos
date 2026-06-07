{...}: {
  networking = {
    hostName = "nixos";
    firewall.enable = true;
    networkmanager.enable = true;
  };
}
