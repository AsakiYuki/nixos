{...}: {
  security.sudo = {
    execWheelOnly = true;
    extraConfig = "
      Defaults env_reset,pwfeedback
    ";
  };
}
