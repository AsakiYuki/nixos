{...}: {
  services.openssh = {
    authorizedKeysInHomedir = true;
    authorizedKeysFiles = ["/home/asakiyuki/.ssh/authorized_keys"];
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
