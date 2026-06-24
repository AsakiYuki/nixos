{libs, ...}: {
  imports = [
    (libs.root "/modules/features/system/openssh.nix")
  ];

  services.openssh = {
    enable = false;
    ports = [22];
    settings = {
      AllowUsers = [
        "asakiyuki"
      ];
    };
  };
}
