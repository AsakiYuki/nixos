{...}: {
  services.forgejo = {
    enable = true;
    database.type = "mysql";

    settings.server = {
      HTTP_PORT = 21350;
    };
  };
}
