let
  fs = import ./libs/fileSystem.nix;
  sshPubKey = file: fs.readRootFile "/assets/public/ssh/${file}";

  root = sshPubKey "root.key.pub";
  system = {
    home-server = sshPubKey "home-server/system.nixos.pub";
    ideapad-slim-5-14apk10 = sshPubKey "ideapad-slim-5-14apk10/system.nixos.pub";
    ideapad-slim-5-14apk10-wsl = sshPubKey "ideapad-slim-5-14apk10/system.nixos.wsl.pub";
  };

  systems = [system.home-server system.ideapad-slim-5-14apk10 system.ideapad-slim-5-14apk10-wsl];
in
  builtins.mapAttrs (_: value: value // {publicKeys = value.publicKeys ++ [root];}) {
    "assets/secrets/services/cloudflare.secret.age".publicKeys = [system.home-server];
    "assets/secrets/services/nginx.auth.json.age".publicKeys = [system.home-server];
    "assets/secrets/services/searx.env.age".publicKeys = [system.home-server];
    "assets/secrets/services/tailscale.secret.age".publicKeys = systems;
    "assets/secrets/users/asakiyuki.pwd.sha256.age" = {
      publicKeys = systems;
      armor = true;
    };
  }
