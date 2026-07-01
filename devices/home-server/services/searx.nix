{...}: {
  services.searx = {
    enable = true;
    # domain = "search.asakiyuki.com";
    settings = {
      server = {
        port = 65530;
        bind_address = "0.0.0.0";
        secret_key = "$SEARX_SECRET_KEY";
      };
    };
  };
}
