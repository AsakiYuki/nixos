{...}: {
  services.httpd = {
    enable = true;
    adminAddr = "vantrong2007vn@gmail.com";

    user = "public";
    group = "public";

    virtualHosts = {
      localhost = {
        documentRoot = "/host/PUBLIC";
        listen = [
          {
            ip = "0.0.0.0";
            port = 37284;
          }
        ];
        extraConfig = ''
          <Directory "/host/PUBLIC">
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
}
