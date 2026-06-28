{...}: {
  services.openssh = {
    enable = false;
    ports = [22];
    settings = {
      AllowUsers = [
        "asakiyuki"
      ];
    };
  };
}
