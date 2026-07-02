{
  pkgs,
  libs,
  ...
}: {
  services.nginx = {
    enable = true;

    commonHttpConfig = ''
      set_real_ip_from 103.21.244.0/22;
      set_real_ip_from 103.22.200.0/22;
      set_real_ip_from 103.31.4.0/22;
      set_real_ip_from 141.101.64.0/18;
      set_real_ip_from 108.162.192.0/18;
      set_real_ip_from 190.93.240.0/20;
      set_real_ip_from 188.114.96.0/20;
      set_real_ip_from 197.234.240.0/22;
      set_real_ip_from 198.41.128.0/17;
      set_real_ip_from 162.158.0.0/15;
      set_real_ip_from 104.16.0.0/13;
      set_real_ip_from 104.24.0.0/14;
      set_real_ip_from 172.64.0.0/13;
      set_real_ip_from 131.0.72.0/22;

      real_ip_header CF-Connecting-IP;
    '';

    package = pkgs.nginx;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    enableReload = true;
    virtualHosts = {
      "_" = {
        default = true;
        rejectSSL = true;
      };

      "asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        globalRedirect = "www.asakiyuki.com";
      };

      "static.asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:37284";
        };
      };

      "search.asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:39212";
          basicAuth = builtins.fromJSON (builtins.readFile (libs.root "/secrets/nginx.auth.json"));
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            auth_basic "Please login to use SearXNG";
          '';
        };
      };

      "adguard.asakiyuki.com" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:34778";
        };
      };

      # "mail.asakiyuki.com" = {
      #   forceSSL = true;
      #   enableACME = true;
      #   locations."/" = {
      #     proxyPass = "http://localhost:47291";
      #   };
      # };

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
