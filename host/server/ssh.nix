{libs, ...}: {
  imports = [
    (libs.root "/modules/features/openssh.nix")
  ];

  services.openssh = {
    enable = true;
    ports = [15523];
    settings = {
      AllowUsers = [
        "asakiyuki"
        "junko"
        "forgejo"
      ];
    };
  };
}
