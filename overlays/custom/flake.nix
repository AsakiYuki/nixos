{
  description = "The Asa's NixOS custom packages overlay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = {...}: {
    overlays.default = import ./default.nix;
  };
}
