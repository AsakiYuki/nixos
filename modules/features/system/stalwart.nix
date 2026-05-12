{...}: {
  services.stalwart-mail = {
    enable = true;
    openFirewall = true;
    credentials = {
      mail-pw1 = "/etc/stalwart/mail-pw1";
      admin-pw = "/etc/stalwart/admin-pw";
    };

    settings = {
      "storage.data.rocksdb" = {
        path = "/var/lib/stalwart-mail/data";
        type = "rocksdb";
      };

      storage.directory = "rocksdb";
      storage.blob = "rocksdb";
      storage.lookup = "rocksdb";

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

      "directory.in-memory" = {
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

      "authentication.fallback-admin" = {
        user = "admin";
        secret = "%{file:/run/credentials/stalwart-mail.service/admin-pw}%";
      };
    };
  };
}
