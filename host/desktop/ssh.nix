{libs, ...}: {
  imports = [
    (libs.root "/modules/features/openssh.nix")
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
