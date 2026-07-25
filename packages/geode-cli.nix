{
  stdenv,
  fetchzip,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "geode-cli";
  version = "3.8.0";

  src = fetchzip {
    url = "https://github.com/geode-sdk/cli/releases/download/v${version}/geode-cli-v${version}-linux.zip";
    hash = "sha256-iktrrg+/OeIsicIeOsgLxZUW9/ZQdqH57D6zqK4kb6c=";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp geode $out/bin
    chmod +x $out/bin/geode
  '';

  meta = with lib; {
    description = "Command-line utilities for working w/ geode";
    homepage = "https://geode-sdk.org/";
    license = with licenses; [
      bsl10
    ];
  };
}
