{...}: {
  services.stalwart-mail = {
    enable = true;
    settings = {
      hostname = "mail.asakiyuki.com";
      tls = {
        enable = true;
        implicit = true;
      };
      listener = {
        smtp = {
          protocol = "smtp";
          bind = "[::]:25";
        };
        submissions = {
          bind = "[::]:465";
          protocol = "smtp";
          tls.implicit = true;
        };
        imaps = {
          bind = "[::]:993";
          protocol = "imap";
          tls.implicit = true;
        };
        jmap = {
          bind = "[::]:42795";
          url = "https://mail.asakiyuki.com";
          protocol = "http";
        };
        management = {
          bind = ["127.0.0.1:42795"];
          protocol = "http";
        };
      };
    };
  };
}
