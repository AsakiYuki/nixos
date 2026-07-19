{
  lib,
  libs,
  inputs,
  pkgs,
  config,
  ...
}: {
  config.age.secrets = let
    mkSecretIf = condition: file: (lib.mkIf condition {file = libs.root file;});
    cfgSvc = config.services;
  in {
    cloudflare = mkSecretIf cfgSvc.cloudflare-dyndns.enable "/assets/secrets/services/cloudflare.secret.age";
    tailscale = mkSecretIf cfgSvc.tailscale.enable "/assets/secrets/services/tailscale.secret.age";
    nginxAuth = mkSecretIf cfgSvc.nginx.enable "/assets/secrets/services/nginx.auth.json.age";
    searxenv = mkSecretIf cfgSvc.searx.enable "/assets/secrets/services/searx.env.age";
    asakiyukipwd.file = "/assets/secrets/users/asakiyuki.pwd.sha256.age";
  };

  environment.systemPackages = [inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default];
  programs.bash.interactiveShellInit = libs.readRootFile "/scripts/completions/agenix.sh";
}
