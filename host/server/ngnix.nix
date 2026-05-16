{...}: {
  services.nginx = {
    enable = true;
    virtualHosts = {
      "hydra.example.com" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:3000";
        };
      };
    };
  };
}
