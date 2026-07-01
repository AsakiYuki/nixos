{...}: {
  services.searx = {
    enable = true;
    # domain = "search.asakiyuki.com";
    settings = {
      server = {
        port = 39212;
        bind_address = "0.0.0.0";
        secret_key = "4e79f3fb5cb25b211a9676f266de4396bb18298373552396f1ce6717e19573b7";
      };
    };
  };
}
