{lib, ...}: {
  mkProgramOption = pkgSet: pkgName: attrs: {
    enable = lib.mkEnableOption (attrs.name or pkgName);
    package = lib.mkPackageOption pkgSet pkgName {};
  };
  mkProgramsOption = name: defaults: {
    enable = lib.mkEnableOption name;
    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = defaults;
    };
  };
}
