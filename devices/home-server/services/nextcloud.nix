{
  libs,
  config,
  lib,
  pkgs,
  ...
}: {
  age.secrets = lib.mkIf config.services.nextcloud.enable {
    "nextcloud-admin-pass" = {
      file = libs.root "/secrets/nextcloud/admin.pass.secret";
      owner = "nextcloud";
      group = "nextcloud";
      mode = "0400";
    };

    "nextcloud-db-pass" = {
      file = libs.root "/secrets/nextcloud/database.pass.secret";
      owner = "nextcloud";
      group = "nextcloud";
      mode = "0400";
    };
  };

  services.nextcloud = {
    enable = true;
    hostName = "drive.example.com";

    database.createLocally = false;

    config = {
      dbhost = "127.0.0.1";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      dbpassFile = config.age.secrets."nextcloud-db-pass".path;

      adminuser = "root";
      adminpassFile = config.age.secrets."nextcloud-admin-pass".path;
    };
  };
}
