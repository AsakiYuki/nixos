{ pkgs, ... }: {
  systemd.services.unmute-mic = {
    description = "Unmute Analog Microphone on Boot";
    wantedBy = [ "multi-user.target" ];
    after = [ "sound.target" ];
    script = ''
      ${pkgs.alsa-utils}/bin/amixer -c 1 set Capture cap || true
      ${pkgs.alsa-utils}/bin/amixer -c 1 set Capture 100% || true
      ${pkgs.alsa-utils}/bin/amixer -c 1 set 'Internal Mic Boost' 1 || true
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
