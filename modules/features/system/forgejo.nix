{...}: {
  services.forgejo = {
    enable = true;
    database.type = "mysql";
    service.DISABLE_REGISTRATION = true;
    settings.server = {
      HTTP_PORT = 21350;
      ROOT_URL = "https://git.asakiyuki.com/";
    };
  };
}
