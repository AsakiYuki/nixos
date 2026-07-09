let
  fs = import ./libs/fileSystem.nix;
  sshPubKey = file: fs.readRootFile "/assets/public/ssh/${file}";

  prefix = "assets/secrets/services";
  svcPrefix = "${prefix}/services";
  usrPrefix = "${prefix}/users";

  system = {
    home-server = sshPubKey "home-server/system.nixos.pub";
    ideapad-slim-5-14apk10 = sshPubKey "ideapad-slim-5-14apk10/system.nixos.pub";
  };
in {
  "${svcPrefix}/cloudflare.secret.age".publicKeys = [system.home-server];
  "${svcPrefix}/nginx.auth.json.age".publicKeys = [system.home-server];
  "${svcPrefix}/searx.env.age".publicKeys = [system.home-server];
  "${svcPrefix}/tailscale.secret.age".publicKeys = [system.home-server system.ideapad-slim-5-14apk10];
  "${usrPrefix}/asakiyuki.pwd.age".publicKeys = [system.home-server system.ideapad-slim-5-14apk10];
}
