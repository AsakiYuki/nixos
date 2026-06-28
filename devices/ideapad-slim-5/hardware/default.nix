{...}: {
  hardware = {
    amdgpu.initrd.enable = true;
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
