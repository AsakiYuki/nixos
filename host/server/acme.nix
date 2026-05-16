{...}: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "me@asakiyuki.com";
    defaults.server = "https://acme-v02.api.letsencrypt.org/directory";
  };
}
