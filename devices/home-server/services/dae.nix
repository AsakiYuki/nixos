{...}: {
  services.dae = {
    enable = true;
    config = builtins.readFile ../configs/dae/proxy.dae;
  };
}
