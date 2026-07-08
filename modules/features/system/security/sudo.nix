{...}: {
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    extraConfig = "
      Defaults env_reset,pwfeedback
    ";
  };
}
