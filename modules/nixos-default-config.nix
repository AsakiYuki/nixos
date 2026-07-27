{
  state-version,
  lib,
  name,
  ...
}: {
  config = {
    nixpkgs.config.allowUnfree = true;
    time.timeZone = "Asia/Ho_Chi_Minh";
    system.stateVersion = state-version;
    nix = {
      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [
          "root"
          "@wheel"
          "asakiyuki"
        ];
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
    networking.hostName = "nixos";
    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      backupFileExtension = "bak";
    };
  };
  options.device.flake-name = lib.mkOption {
    type = lib.types.str;
    default = name;
    description = "Flake name for quick rebuild";
  };
}
