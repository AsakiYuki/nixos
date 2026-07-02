{
  config,
  pkgs,
  ...
}: {
  services.nextcloud = {
    enable = true;
    hostName = "drive.asakiyuki.com";
    package = pkgs.nextcloud30;

    database.createLocally = false;
    database.type = "mysql";

    config = {
      dbhost = "127.0.0.1";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      dbpassFile = config.age.secrets."nextcloud-db-pass".path;
      adminuser = "root";
      adminpassFile = config.age.secrets."nextcloud-admin-pass".path;
    };

    poolSettings = {
      "listen" = "127.0.0.1:9000";
    };
  };
}
