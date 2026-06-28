{pkgs, ...}: {
  systemd.services = {
    sync-windows-bootloader = {
      description = "Sync Windows bootloader to Linux ESP";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.rsync}/bin/rsync -a --delete /mnt/win-efi/EFI/Microsoft/ /boot/EFI/Microsoft/";
      };
    };
  };
}
