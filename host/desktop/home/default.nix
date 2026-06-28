{...}: {
  home-manager = {
    useGlobalPkgs = true;
    users = {
      asakiyuki.imports = [./asakiyuki];
    };
  };
}
