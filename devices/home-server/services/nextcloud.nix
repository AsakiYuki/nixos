{...}: {
  services.nextcloud = {
    enable = true;

    database = {
      type = "mysql";
      host = "localhost";
      name = "nextcloud";
      user = "nextcloud";
      passwordFile = "/var/lib/nextcloud/mysql-password";
    };

    poolSettings = {
      listen = "localhost:9000";
    };

    config = {
      adminuser = "root";
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };
}
