let
  fs = import ./libs/fileSystem.nix;
  sshPubKey = file: fs.readRootFile "/assets/public/ssh/${file}";

  prefix = "assets/secrets";
  svcPrefix = "${prefix}/services";
  usrPrefix = "${prefix}/users";

  root = sshPubKey "root.key.pub";
  system = {
    home-server = sshPubKey "home-server/system.nixos.pub";
    ideapad-slim-5-14apk10 = sshPubKey "ideapad-slim-5-14apk10/system.nixos.pub";
    ideapad-slim-5-14apk10-wsl = sshPubKey "ideapad-slim-5-14apk10/system.nixos.wsl.pub";
  };

  systems = [system.home-server system.ideapad-slim-5-14apk10 system.ideapad-slim-5-14apk10-wsl];
in
  builtins.mapAttrs (_: keys: [root] ++ keys) {
    "${svcPrefix}/cloudflare.secret.age".publicKeys = [system.home-server];
    "${svcPrefix}/nginx.auth.json.age".publicKeys = [system.home-server];
    "${svcPrefix}/searx.env.age".publicKeys = [system.home-server];
    "${svcPrefix}/tailscale.secret.age".publicKeys = systems;
    "${usrPrefix}/asakiyuki.pwd.sha256.age" = {
      publicKeys = systems;
      armor = true;
    };
  }
