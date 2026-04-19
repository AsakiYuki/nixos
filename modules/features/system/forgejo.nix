{...}: {
  services.forgejo = {
    enable = true;
    database.type = "mysql";
    settings = {
      service.DISABLE_REGISTRATION = true;
      server = {
        HTTP_PORT = 21350;
        SSH_PORT = 15523;
        START_SSH_SERVER = false;
        SSH_CREATE_AUTHORIZED_KEYS_FILE = true;
        SSH_DOMAIN = "server.asakiyuki.com";
        ROOT_URL = "https://git.asakiyuki.com/";
      };
    };
  };
}
