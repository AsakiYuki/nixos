{...}: {
  services.logind = {
    settings = {
      Login = {
        HandlePowerKey = "ignore";
      };
    };
  };
}
