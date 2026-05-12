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

      acme."letsencrypt" = {
        directory = "https://acme-v02.api.letsencrypt.org/directory";
        challenge = "dns-01";
        contact = "admin@asakiyuki.com";
        domains = ["asakiyuki.com" "mx1.asakiyuki.com"];
        provider = "cloudflare";
        secret = "%{file:/run/credentials/stalwart-mail.service/cf-token}%";
      };

      lookup.default = {
        hostname = "mx1.asakiyuki.com";
        domain = "asakiyuki.com";
      };

      storage.directory = "in-memory";

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

      session.auth = {
        mechanisms = "[plain]";
        directory = "'in-memory'";
      };

      authentication.fallback-admin = {
        user = "admin";
        secret = "%{file:/run/credentials/stalwart-mail.service/admin-pw}%";
      };
    };
  };
}
