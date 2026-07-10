{...}: {
  config.services.openssh = {
    enable = true;
    authorizedKeysInHomedir = true;
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      AllowAgentForwarding = false;
      AllowStreamLocalForwarding = false;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };
}
