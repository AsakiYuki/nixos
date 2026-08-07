{pkgs, ...}: let
  dev-version = "28";
in
  pkgs.stdenv.mkDerivation rec {
    pname = "lsfg-vk";
    version = "2.0.0";

    src = pkgs.fetchzip {
      url = "https://github.com/PancakeTAS/lsfg-vk/releases/download/v${version}-dev/lsfg-vk-${version}-dev${dev-version}-linux.tar.xz";
      hash = "sha256-JiATwEz6NEVsab11O0HNmFzM3S3aANT0YLWqYAwJVk0=";
      stripRoot = false;
    };

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      qt6.wrapQtAppsHook
    ];

    buildInputs = with pkgs; [
      qt6.qtbase
      qt6.qtdeclarative
      stdenv.cc.cc.lib
      vulkan-loader
    ];

    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r ./* $out/

      runHook postInstall
    '';
  }
