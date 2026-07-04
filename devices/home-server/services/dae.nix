{...}: {
  services.dae = {
    enable = true;
    config = builtins.readFile ../configs/proxy.dae;
  };
}
