{...}: {
  config.services.openssh = {
    enable = true;
    authorizedKeysInHomedir = true;
    settings = {
      KbdInteractiveAuthentication = false;
      AllowAgentForwarding = false;
      AllowStreamLocalForwarding = false;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };
}
