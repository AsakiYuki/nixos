{...}: {
  services.openssh = {
    enable = true;
    ports = [15523];
    passwordAuthentication = false;
    settings = {
      AllowUsers = [
        "asakiyuki"
        "junko"
        "forgejo"
      ];
    };
  };
}
