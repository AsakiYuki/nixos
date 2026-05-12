{...}: {
  services.stalwart-mail = {
    enable = true;
    openFirewall = true;
    credentials = {
      db-dsn = "/etc/stalwart/db-dsn";
      admin-pw = "/etc/stalwart/admin-pw";
    };

    settings = {
      # ĐỊNH NGHĨA STORAGE GỐC KHỚP VỚI TÊN "db" CỦA MODULE
      storage = {
        data.db = {
          dsn = "%{file:/run/credentials/stalwart-mail.service/db-dsn}%";
          type = "sql";
        };
        directory = "db";
        blob = "db";
        lookup = "db";
        fts = "db";
      };

      server.hostname = "mx1.asakiyuki.com";

      # LISTENER
      server.listener = {
        smtp = {
          bind = ["[::]:25"];
          protocol = "smtp";
        };
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
        management = {
          bind = ["0.0.0.0:47291"];
          protocol = "http";
        };
      };

      lookup.default = {
        hostname = "mx1.asakiyuki.com";
        domain = "asakiyuki.com";
      };

      # USER DIRECTORY
      directory.sql.type = "sql";

      authentication.fallback-admin = {
        user = "admin";
        secret = "%{file:/run/credentials/stalwart-mail.service/admin-pw}%";
      };
    };
  };

  systemd.services.stalwart-mail.after = ["mysql.service"];
}
