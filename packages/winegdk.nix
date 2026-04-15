{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "winegdk";
  version = "1.0.0";
  src = fetchFromGitHub {
    owner = "Weather-OS";
    repo = "winegdk";
    rev = "5cffa07a43a61a2fd1695d714b85b5b44852d55b";
    sha256 = "000000000000000000000000000000000000000000000000000";
  };
}
