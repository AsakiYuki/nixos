{
  stdenv,
  fetchzip,
}:
stdenv.mkDerivation rec {
  pname = "geode-cli";
  version = "3.8.0";

  src = fetchzip {
    url = "https://github.com/geode-sdk/cli/releases/download/v${version}/geode-cli-v${version}-linux.zip";
    hash = "sha256-xJrY3j1ZR1wlE5pPrkx5cET8aMCbBOWZHJOQhlhbZ6Q=";
  };
}
