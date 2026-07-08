{...}: {
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = false;
    extraConfig = "
      Defaults env_reset,pwfeedback
    ";
  };
}
