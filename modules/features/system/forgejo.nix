{...}: {
  services.forgejo = {
    enable = true;
    database.type = "mysql";

    settings.server = {
      HTTP_PORT = 21350;
      DISABLE_REGISTRATION = true;
      ROOT_URL = "https://git.asakiyuki.com/";
    };
  };
}
