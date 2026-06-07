{...}: {
  networking = {
    hostName = "nixos";
    firewall.enable = true;

    useDHCP = true;
    networkmanager.enable = true;
  };
}
