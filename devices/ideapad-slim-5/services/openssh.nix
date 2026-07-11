{...}: {
  services.openssh = {
    ports = [22];
    settings = {
      # AllowUsers = ["hao1337"];
      PasswordAuthentication = false;
    };
  };
}
