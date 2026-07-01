{...}: {
  services.searx = {
    enable = true;
    # domain = "search.asakiyuki.com";
    settings = {
      server = {
        port = 39212;
        bind_address = "0.0.0.0";
        secret_key = "$SEARX_SECRET_KEY";
      };
    };
  };
}
