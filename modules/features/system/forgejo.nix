{...}: {
  services.forgejo = {
    enable = true;
    database.type = "mysql";
    settings = {
      service.DISABLE_REGISTRATION = true;
      server = {
        HTTP_PORT = 21350;
        ROOT_URL = "https://git.asakiyuki.com/";
      };
    };
  };
}
