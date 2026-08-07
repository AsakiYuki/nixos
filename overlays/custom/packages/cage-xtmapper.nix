{
  pkgs,
  version ? "0.2.0",
  ...
}: let
  metadata =
    if (version == "0.2.0")
    then {
      release_version = "20260208";
      package_version = "0.2.0";
      hash = "sha256-F1C3KnTzTO1vEouixqO1xnsGmufRyAk+BiRlypNq4kQ=";
    }
    else {
      release_version = "20260208";
      package_version = "0.1.5";
      hash = "sha256-ZmdltOQInGbCBpf/e8D2sB9Rjt4wqd8wwuSFvryHfFA=";
    };
in
  pkgs.stdenv.mkDerivation {
    pname = "cage-xtmapper";
    version = metadata.package_version;

    src = pkgs.fetchurl {
      url = "https://github.com/Xtr126/cage-xtmapper/releases/download/v${metadata.release_version}/cage-xtmapper-v${metadata.package_version}.tar";
      hash = metadata.hash;
    };

    nativeBuildInputs = [pkgs.autoPatchelfHook];

    buildInputs = with pkgs; [
      wayland
      libxkbcommon
      pixman
      libdrm
      libGL
      mesa
      vulkan-loader
      udev
      seatd
      libxcb-render-util
    ];

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/bin
      tar xvf $src
      cp usr/local/bin/cage_xtmapper $out/bin/
      cp usr/local/bin/cage_xtmapper.sh $out/bin/
      chmod +x $out/bin/cage_xtmapper
      chmod +x $out/bin/cage_xtmapper.sh
    '';

    meta = with pkgs.lib; {
      description = "cage-xtmapper input mapping tool";
      homepage = "https://github.com/Xtr126/cage-xtmapper";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  }
