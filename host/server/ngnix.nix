{...}: {
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "_" = {
        default = true;
        forceSSL = true;
        enableACME = true;
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
