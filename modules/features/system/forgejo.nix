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

  cfg = config.services.forgejo;
in {
  services.forgejo = {
    enable = true;
    database.type = "mysql";

    settings = {
      DEFAULT = {
        APP_NAME = "Asa's git";
      };

      service = {
        DISABLE_REGISTRATION = true;
      };

      actions = {
        ENABLED = true;
      };

      ui = {
        THEMES = "catppuccin-mocha-lavender";
        DEFAULT_THEME = "catppuccin-mocha-lavender";
      };

      server = {
        HTTP_PORT = 21350;
        SSH_PORT = 15523;
        START_SSH_SERVER = false;
        SSH_CREATE_AUTHORIZED_KEYS_FILE = true;
        SSH_DOMAIN = "asakiyuki.com";
        ROOT_URL = "https://git.asakiyuki.com/";
      };
    };
  };

  systemd.services.gitea-runner-asa = lib.mkIf cfg.enable {
    after = ["network.target" "nginx.service"];
    wants = ["nginx.service"];

    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

  services.gitea-actions-runner.instances.asa = lib.mkIf cfg.enable {
    enable = true;
    name = "Asa runner";
    url = cfg.settings.server.ROOT_URL;
    tokenFile = "/var/lib/gitea-runner/asa/token";

    labels = [
      "ubuntu-latest:docker://ghcr.io/catthehacker/ubuntu:act-22.04"
      "ubuntu-22.04:docker://ghcr.io/catthehacker/ubuntu:act-22.04"
      "ubuntu-20.04:docker://ghcr.io/catthehacker/ubuntu:act-20.04"
      "self-hosted:docker://ghcr.io/catthehacker/ubuntu:act-22.04"
    ];

    settings = {
      container.network = "host";
    };

    hostPackages = [];
  };

  systemd.tmpfiles.rules = lib.mkIf cfg.enable [
    "d ${cfg.customDir}/public/assets/css 0755 forgejo forgejo -"
  ];

  system.activationScripts.forgejoTheme.text = lib.mkIf config.services.forgejo.enable ''
    mkdir -p ${config.services.forgejo.customDir}/public/assets/css
    mkdir -p ${config.services.forgejo.customDir}/public/assets/img

    cp -r ${catppuccin}/* ${config.services.forgejo.customDir}/public/assets/css/

    cp ${libs.root "/assets/forgejo/img/logo.png"} ${config.services.forgejo.customDir}/public/assets/img/logo.png
    cp ${libs.root "/assets/forgejo/img/favicon.png"} ${config.services.forgejo.customDir}/public/assets/img/logo.png
    cp ${libs.root "/assets/forgejo/img/logo.svg"} ${config.services.forgejo.customDir}/public/assets/img/logo.svg
    cp ${libs.root "/assets/forgejo/img/favicon.svg"} ${config.services.forgejo.customDir}/public/assets/img/logo.svg
  '';
}
