{
  config,
  pkgs,
  lib,
  ...
}: let
  catppuccin = pkgs.stdenv.mkDerivation {
    name = "catppuccin-gitea";

    src = pkgs.fetchurl {
      url = "https://github.com/catppuccin/gitea/releases/download/v1.0.2/catppuccin-gitea.tar.gz";
      sha256 = "sha256-rZHLORwLUfIFcB6K9yhrzr+UwdPNQVSadsw6rg8Q7gs=";
    };

    unpackPhase = "tar -xzf $src";

    installPhase = ''
      mkdir -p $out
      cp -r * $out/
    '';
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

  systemd.tmpfiles.rules = lib.optional config.services.forgejo.enable [
    "d ${config.services.forgejo.stateDir}/custom/public/assets/css 0755 forgejo forgejo -"
    "C ${config.services.forgejo.stateDir}/custom/public/assets/css - - - - ${catppuccin}"
  ];
}
