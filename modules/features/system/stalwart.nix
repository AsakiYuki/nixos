{
  config,
  lib,
  pkgs,
  ...
}: {
  services.stalwart-mail = {
    enable = true;
    openFirewall = true;

    credentials = {
      mail-pw1 = "/etc/stalwart/mail-pw1";
      admin-pw = "/etc/stalwart/admin-pw";
      cf-token = "/home/asakiyuki/.secret/CLOUDFLARE_TOKEN_KEY";
      db-pw = "/etc/stalwart/db-pw"; # <-- thêm cái này
    };

    settings = {
      server = {
        hostname = "mx1.asakiyuki.com";

        tls = {
          enable = true;
          implicit = true;
          certificate = "letsencrypt";
        };

        listener = {
          smtp = {
            protocol = "smtp";
            bind = ["[::]:25"];
          };

          submissions = {
            protocol = "smtp";
            bind = "[::]:465";
            tls.implicit = true;
          };

          imaps = {
            protocol = "imap";
            bind = "[::]:993";
            tls.implicit = true;
          };

          management = {
            protocol = "http";
            bind = ["0.0.0.0:47291"];
          };
        };
      };

      # =========================
      # DATABASE (MariaDB)
      # =========================
      store."mariadb" = {
        type = "mysql";
        host = "127.0.0.1";
        port = 3306;
        database = "stalwart";
        user = "stalwart";
        password = "%{file:/run/credentials/stalwart-mail.service/db-pw}%";
      };

      # =========================
      # DIRECTORY (AUTH)
      # =========================
      directory."sql" = {
        type = "sql";
        store = "mariadb";
      };

      session.auth = {
        mechanisms = "[plain]";
        directory = "'sql'";
      };

      # =========================
      # STORAGE (GIỮ LOCAL)
      # =========================
      storage = {
        data = "rocksdb";
        blob = "filesystem";
      };

      # =========================
      # LOOKUP
      # =========================
      lookup.default = {
        hostname = "mx1.asakiyuki.com";
        domain = "asakiyuki.com";
      };

      # =========================
      # ADMIN
      # =========================
      authentication.fallback-admin = {
        user = "admin";
        secret = "%{file:/run/credentials/stalwart-mail.service/admin-pw}%";
      };

      # =========================
      # ACME (giữ nguyên của mày)
      # =========================
      acme."letsencrypt" = {
        directory = "https://acme-v02.api.letsencrypt.org/directory";
        challenge = "dns-01";
        contact = "admin@asakiyuki.com";
        domains = ["asakiyuki.com" "mx1.asakiyuki.com"];
        provider = "cloudflare";
        secret = "%{file:/run/credentials/stalwart-mail.service/cf-token}%";
      };
    };
  };
}
