{...}: {
  services.stalwart-mail = {
    enable = true;
    openFirewall = true;
    credentials = {
      mail-pw1 = "/etc/stalwart/mail-pw1";
      admin-pw = "/etc/stalwart/admin-pw";
    };

    settings = {
      storage.data.db = {
        path = "/var/lib/stalwart-mail/db";
        type = "rocksdb";
      };

      storage.directory = "db";
      storage.blob = "db";
      storage.lookup = "db";
      storage.fts = "db";

      server.hostname = "mx1.asakiyuki.com";

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

      directory.in-memory = {
        type = "memory";
        principals = [
          {
            class = "individual";
            name = "Asaki Yuki";
            secret = "%{file:/run/credentials/stalwart-mail.service/mail-pw1}%";
            email = ["admin@asakiyuki.com"];
          }
        ];
      };

      authentication.fallback-admin = {
        user = "admin";
        secret = "%{file:/run/credentials/stalwart-mail.service/admin-pw}%";
      };
    };
  };
}
