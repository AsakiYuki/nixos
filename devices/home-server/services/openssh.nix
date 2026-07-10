{...}: {
  services.openssh = {
    enable = true;
    ports = [15523];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [
        "asakiyuki"
        "junko"
        "hieze"
        "forgejo"
      ];
    };
  };
}
