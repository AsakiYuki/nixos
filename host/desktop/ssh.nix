{libs, ...}: {
  imports = [
    (libs.root "/modules/services/openssh.nix")
  ];

  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      AllowUsers = [
        "asakiyuki"
      ];
    };
  };
}
