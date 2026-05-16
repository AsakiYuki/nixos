{...}: {
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    enableReload = true;
    virtualHosts = {
      "_" = {
        default = true;
        onlySSL = true;
        sslCertificate = "/var/lib/acme/dummy.crt";
        sslCertificateKey = "/var/lib/acme/dummy.key";
        locations."/" = {
          return = "404";
        };
      };

      "asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        globalRedirect = "www.asakiyuki.com";
      };

      "adguard.asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:34778";
        };
      };

      "mail.asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:47291";
        };
      };

      "git.asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:21350";
        };
      };
    };
  };
}
