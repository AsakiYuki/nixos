{ ... }: {
    fileSystems."/mnt/windows" = {
        device = "/dev/disk/by-uuid/0000294D000006E6";
        fsType = "ntfs-3g";
        options = [
            "rw"
            "uid=1000"
            "gid=100"
            "umask=022"
        ];
    };
}