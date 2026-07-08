{...}: {
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
    extraConfig = "
      Defaults env_reset,pwfeedback
    ";
  };
}
