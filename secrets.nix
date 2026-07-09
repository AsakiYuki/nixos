let
  fs = import ./libs/fileSystem.nix;
  sshPubKey = file: fs.readRootFile "/assets/public/ssh/${file}";

  homeServerSystem = sshPubKey "home-server/system.nixos.pub";
in {
  "assets/secrets/cloudflare.secret.age".publicKeys = [homeServerSystem];
}
