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
      db-dsn = "/etc/stalwart/db-dsn"; # File chứa: mysql://user:pass@localhost/stalwart
    };

    settings = {
      # 1. FIX LỖI DATABASE: Ép module dùng MariaDB thông qua key "store.db"
      "store.db" = {
        dsn = "%{file:/run/credentials/stalwart-mail.service/db-dsn}%";
        type = "sql";
      };

      storage = {
        directory = "db";
        blob = "db";
        lookup = "db";
        fts = "db";
      };

      server = {
        hostname = "mx1.asakiyuki.com";
        tls = {
          enable = true;
          implicit = true;
        };
        # 2. FIX LỖI "attribute 'protocol' missing": Mọi listener đều phải có protocol
        listener = {
          smtp = {
            protocol = "smtp"; # Bắt buộc phải có
            bind = ["[::]:25"];
          };
          submissions = {
            protocol = "smtp"; # Bắt buộc phải có
            bind = "[::]:465";
            tls.implicit = true;
          };
          imaps = {
            protocol = "imap"; # Bắt buộc phải có
            bind = "[::]:993";
            tls.implicit = true;
          };
          management = {
            protocol = "http"; # Bắt buộc phải có
            bind = ["0.0.0.0:47291"];
          };
        };
      };

      lookup.default = {
        hostname = "mx1.asakiyuki.com";
        domain = "asakiyuki.com";
      };

      # Dùng SQL thay vì memory để lưu user bền vững
      "directory.sql" = {
        type = "sql";
      };

      # Giữ lại user admin cứng trong file nix nếu muốn
      directory."in-memory" = {
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

  # Đảm bảo MariaDB khởi động trước
  systemd.services.stalwart-mail.after = ["mysql.service"];
}
