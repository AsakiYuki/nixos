{...}: {
  services.udev.extraRules = ''
    KERNEL=="ntsync", MODE="0666"
  '';
}
