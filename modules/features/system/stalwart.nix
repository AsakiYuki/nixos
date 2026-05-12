{...}: {
  services.stalwart-mail = {
    enable = true;
    openFirewall = true;
    credentials = {
      db-dsn = "/etc/stalwart/db-dsn";
      admin-pw = "/etc/stalwart/admin-pw";
    };

    settings = {
      "storage.data.db" = {
        dsn = "%{file:/run/credentials/stalwart-mail.service/db-dsn}%";
        type = "sql";
      };

      storage.directory = "db";
      storage.blob = "db";
      storage.lookup = "db";
      storage.fts = "db";

      server.hostname = "mx1.asakiyuki.com";

      "server.listener.smtp" = {
        bind = ["[::]:25"];
        protocol = "smtp";
      };
      "server.listener.submissions" = {
        bind = "[::]:465";
        protocol = "smtp";
        tls.implicit = true;
      };
      "server.listener.imaps" = {
        bind = "[::]:993";
        protocol = "imap";
        tls.implicit = true;
      };
      "server.listener.management" = {
        bind = ["0.0.0.0:47291"];
        protocol = "http";
      };

      "lookup.default" = {
        hostname = "mx1.asakiyuki.com";
        domain = "asakiyuki.com";
      };

      "directory.sql" = {
        type = "sql";
      };

      authentication.fallback-admin = {
        user = "admin";
        secret = "%{file:/run/credentials/stalwart-mail.service/admin-pw}%";
      };
    };
  };

  systemd.services.stalwart-mail.after = ["mysql.service"];
}
