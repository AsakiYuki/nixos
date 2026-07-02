{...}: {
  services.nextcloud = {
    enable = true;
    hostName = "drive.asakiyuki.com";

    database.createLocally = false;

    config = {
      dbhost = "127.0.0.1";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      dbpassFile = "/etc/nextcloud-db-pass";
      adminuser = "admin";
      adminpassFile = "/etc/nextcloud-admin-pass";
      dbtype = "mysql";
    };

    poolSettings = {
      "listen" = "127.0.0.1:9000";
    };
  };
}
