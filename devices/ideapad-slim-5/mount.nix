{...}: {
  fileSystems = {
    "/mnt/windows" = {
      device = "/dev/disk/by-uuid/0000294D000006E6";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
        "gid=100"
        "umask=000"
        "nofail"
        "x-systemd.automount"
      ];
    };
    "/mnt/waydroid" = {
      device = "/home/asakiyuki/.local/share/waydroid/data/media/0";
      fsType = "fuse.bindfs";
      options = [
        "mirror=1000"
        "xattr-none"
        "chmod-ignore"
      ];
    };
  };
}
