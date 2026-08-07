{
  pkgs,
  prev,
  ...
}:
prev.cider-2.overrideAttrs (prevAtts: rec {
  version = "4.0.9.1";

  src = pkgs.fetchurl {
    url = "https://static.asakiyuki.com/packages/nixos/cider-v${version}-linux-x64.deb";
    hash = "sha256-MsA6lK3PsyOEx938FgJFx8l9oqwoM3FzIK5goF73lTs=";
  };

  postInstall = builtins.replaceStrings ["--replace-fail"] ["--replace-warn"] prevAtts.postInstall;
})
