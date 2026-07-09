let
  fs = import ./libs/fileSystem.nix;
  sshPubKey = file: fs.readRootFile "/assets/public/ssh/${file}";

  system = {
    home-server = sshPubKey "home-server/system.nixos.pub";
    ideapad-slim-5-14apk10 = sshPubKey "ideapad-slim-5-14apk10/system.nixos.pub";
  };
in {
  "assets/secrets/cloudflare.secret.age".publicKeys = [system.home-server];
  "assets/secrets/tailscale.secret.age".publicKeys = [system.home-server system.ideapad-slim-5-14apk10];
}
