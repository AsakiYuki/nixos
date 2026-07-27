{pkgs, ...}:
pkgs.cider-2.overrideAttrs (prevAtts: rec {
  version = "4.0.0";

  src = pkgs.fetchurl {
    url = "https://static.asakiyuki.com/packages/nixos/cider-v${version}-linux-x64.deb";
    hash = "sha256-Z5B7VQatTEktt4e7aF5EGDTufgwfRHJzCZ1Lia/aIFk=";
  };

  postInstall = builtins.replaceStrings ["--replace-fail"] ["--replace-warn"] prevAtts.postInstall;
})
