{
  config,
  pkgs,
  lib,
  libs,
  ...
}: let
  catppuccin = pkgs.fetchzip {
    url = "https://github.com/catppuccin/gitea/releases/download/v1.0.2/catppuccin-gitea.tar.gz";
    sha256 = "sha256-rZHLORwLUfIFcB6K9yhrzr+UwdPNQVSadsw6rg8Q7gs=";
    stripRoot = false;
  };
in {
  services.forgejo = {
    enable = true;
    database.type = "mysql";

    settings = {
      service.DISABLE_REGISTRATION = true;
      ui = {
        THEMES = "catppuccin-mocha-lavender";
        DEFAULT_THEME = "catppuccin-mocha-lavender";
      };
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
    "d ${config.services.forgejo.customDir}/public/assets/css 0755 forgejo forgejo -"
  ];

  system.activationScripts.forgejoTheme.text = lib.mkIf config.services.forgejo.enable ''
    mkdir -p ${config.services.forgejo.customDir}/public/assets/css
    mkdir -p ${config.services.forgejo.customDir}/public/assets/img

    cp -r ${catppuccin}/* ${config.services.forgejo.customDir}/public/assets/css/

    cp -r ${libs.root "/assets/forgejo/img/"}* ${config.services.forgejo.customDir}/public/assets/img/
  '';
}
