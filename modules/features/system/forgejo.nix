{
  config,
  pkgs,
  lib,
  ...
}: let
  catppuccin = pkgs.fetchzip {
    url = "https://github.com/catppuccin/gitea/releases/download/v1.0.2/catppuccin-gitea.tar.gz";
    sha256 = "sha256-rZHLORwLUfIFcB6K9yhrzr+UwdPNQVSadsw6rg8Q7gs=";
  };
in {
  services.forgejo = {
    enable = true;
    database.type = "mysql";

    settings = {
      service.DISABLE_REGISTRATION = true;
      server = {
        HTTP_PORT = 21350;
        SSH_PORT = 15523;
        START_SSH_SERVER = false;
        SSH_CREATE_AUTHORIZED_KEYS_FILE = true;
        SSH_DOMAIN = "server.asakiyuki.com";
        ROOT_URL = "https://git.asakiyuki.com/";
      };
    };
  };

  systemd.tmpfiles.rules = lib.mkIf config.services.forgejo.enable [
    "d ${config.services.forgejo.stateDir}/custom/public/assets/css 0755 forgejo forgejo -"
  ];

  system.activationScripts.forgejoTheme.text = lib.mkIf config.services.forgejo.enable ''
    mkdir -p ${config.services.forgejo.stateDir}/custom/public/assets/css
    cp -r ${catppuccin}/* ${config.services.forgejo.stateDir}/custom/public/assets/css/
  '';
}
