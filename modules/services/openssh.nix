{...}: {
  services.openssh = {
    enable = true;
    ports = [15523];
    authorizedKeysInHomedir = true;
    authorizedKeysFiles = ["/home/asakiyuki/.ssh/authorized_keys"];
    settings = {
      AllowUsers = [
        "asakiyuki"
        "junko"
        "forgejo"
      ];
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      AllowAgentForwarding = false;
      AllowStreamLocalForwarding = false;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };
}
