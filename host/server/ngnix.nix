{...}: {
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "_" = {
        default = true;
        forceSSL = true;
        onlySSL = true;
        sslCertificate = "/var/lib/acme/dummy.crt";
        sslCertificateKey = "/var/lib/acme/dummy.key";
        locations."/" = {
          return = "444";
        };
      };

      "asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        globalRedirect = "www.asakiyuki.com";
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
