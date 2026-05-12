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
    };

    settings = {
      server = {
        hostname = "mx1.asakiyuki.com";

        tls = {
          enable = true;
          implicit = true;
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

      storage = {
        data = "rocksdb";
        blob = "filesystem";
      };

      store."rocksdb" = {
        type = "rocksdb";
        path = "/var/lib/stalwart/data";
      };

      store."filesystem" = {
        type = "fs";
        path = "/var/lib/stalwart/blobs";
      };

      directory."local" = {
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

      session.auth = {
        mechanisms = "[plain]";
        directory = "'local'";
      };

      lookup.default = {
        hostname = "mx1.asakiyuki.com";
        domain = "asakiyuki.com";
      };

      authentication.fallback-admin = {
        user = "admin";
        secret = "%{file:/run/credentials/stalwart-mail.service/admin-pw}%";
      };
    };
  };
}
