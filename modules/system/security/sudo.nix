{...}: {
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
    extraConfig = ''
      Defaults env_reset,pwfeedback
      Defaults lecture = never
      Defaults insults
      Defaults !tty_tickets
    '';
  };
}
