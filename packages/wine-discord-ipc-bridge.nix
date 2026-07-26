{
  stdenv,
  fetchzip,
  lib,
}:
stdenv.mkDerivation {
  pname = "wine-discord-ipc-bridge";
  version = "0.0.3";

  src = fetchzip {
    url = "https://static.asakiyuki.com/packages/nixos/wine-discord-ipc-bridge.tar.gz";
    hash = "sha256-psh5fopcgq1cB+OGlqpDdeBMEOClNS40HzWACM6Ur5Q=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp launch.sh $out/bin/wine-discord-ipc-bridge.sh
    cp winediscordipcbridge.exe $out/bin/
    chmod +x $out/bin/wine-discord-ipc-bridge.sh
  '';

  meta = with lib; {
    description = "Enable games running under Wine to use Discord Rich Presence";
    homepage = "https://github.com/0e4ef622/wine-discord-ipc-bridge/";
    license = licenses.mit;
    mainProgram = "wine-discord-ipc-bridge";
  };
}
