{...}: {
  security.pam = {
    services = {
      asakiyuki.kwallet.enable = true;
    };
  };
}
