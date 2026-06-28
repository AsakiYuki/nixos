{...}: {
  services = {
    power-profiles-daemon.enable = true;
    xserver.videoDrivers = ["amdgpu"];
  };
}
