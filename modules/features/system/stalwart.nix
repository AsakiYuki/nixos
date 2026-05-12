{...}: {
  services.stalwart-mail = {
    enable = true;
    openFirewall = true;
    credentials = {
      db-dsn = "/etc/stalwart/db-dsn";
      admin-pw = "/etc/stalwart/admin-pw";
    };

    settings = {
      "store.db" = {
        dsn = "%{file:/run/credentials/stalwart-mail.service/db-dsn}%";
        type = "sql";
      };

      storage.directory = "db";
      storage.blob = "db";
      storage.lookup = "db";
      storage.fts = "db";

      server.hostname = "mx1.asakiyuki.com";

      server.listener = {
        smtp.bind = ["[::]:25"];
        submissions = {
          bind = "[::]:465";
          protocol = "smtp";
          tls.implicit = true;
        };
        imaps = {
          bind = "[::]:993";
          protocol = "imap";
          tls.implicit = true;
        };
        management.bind = ["0.0.0.0:47291"];
      };

      lookup.default = {
        hostname = "mx1.asakiyuki.com";
        domain = "asakiyuki.com";
      };

      "directory.sql".type = "sql";

      authentication.fallback-admin = {
        user = "admin";
        secret = "%{file:/run/credentials/stalwart-mail.service/admin-pw}%";
      };
    };
  };

  systemd.services.stalwart-mail.after = ["mysql.service"];
}
