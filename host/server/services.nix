{
  libs,
  pkgs,
  ...
}: {
  imports = [
    ./nginx.nix
    ./acme.nix

    (libs.root "/modules/features/system/forgejo.nix")
  ];

  services = {
    logrotate = {
      enable = true;
      checkConfig = false;
    };

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    fail2ban = {
      enable = true;
      ignoreIP = [
        "192.168.0.0/16"
      ];
    };

    adguardhome = {
      enable = true;
      port = 34778;
      openFirewall = true;
    };

    httpd = {
      enable = true;
      adminAddr = "vantrong2007vn@gmail.com";

      user = "static";
      group = "public";

      virtualHosts = {
        localhost = {
          documentRoot = "/home/PUBLIC";
          listen = [
            {
              ip = "0.0.0.0";
              port = 37284;
            }
          ];
          extraConfig = ''
            <Directory "/home/PUBLIC">
                Options -Indexes +FollowSymLinks
                AllowOverride None
                Require all granted

                <LimitExcept GET HEAD OPTIONS>
                    Require all denied
                </LimitExcept>
            </Directory>
          '';
        };
      };
    };

    cloudflare-dyndns = {
      enable = true;
      apiTokenFile = "/home/asakiyuki/SECRET/CLOUDFLARE_TOKEN_KEY";
      frequency = "*:0/5";
      proxied = false;
      ipv6 = false;
      ipv4 = true;
      deleteMissing = false;
      domains = [
        "asakiyuki.com"
        "ddns.asakiyuki.com"
        "mx1.asakiyuki.com"
      ];
    };
  };
}
