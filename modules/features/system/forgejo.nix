{...}: {
  services.forgejo = {
    enable = true;
    database.type = "mysql";
    settings.server = {
      HTTP_PORT = 21350;
      ROOT_URL = "https://git.asakiyuki.com/";
      service.DISABLE_REGISTRATION = true;
    };
  };
}
