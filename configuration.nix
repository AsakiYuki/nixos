{ config, lib, pkgs, ... }:
let home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz; in
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; }; in
{
  imports = [ 
    ./configuration/hardware.nix
    (import "${home-manager}/nixos") 
  ];

  # Home Manager
  home-manager.users.asalinux = import ./home/home.nix;
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Services
  services.flatpak.enable = true;
  nixpkgs.config.allowUnfree = true;
  
  # Network
  networking.hostName = "nixos";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Ho_Chi_Minh";

  security.rtkit.enable = true;
  services.xserver = { enable = true; };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    audio.enable = true;
    jack.enable = true;
  };

  users.users.asalinux = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ tree ];
  };

  programs.firefox.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; import ./packages.nix { inherit pkgs unstable; };
  system.stateVersion = "25.05";
}

