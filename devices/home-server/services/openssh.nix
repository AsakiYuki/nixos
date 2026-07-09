{lib, ...}: {
  services.openssh = {
    enable = true;
    ports = [15523];
    settings = {
      PasswordAuthentication = lib.mkForce false;
      AllowUsers = [
        "asakiyuki"
        "junko"
        "forgejo"
      ];
    };
  };
}
