{pkgs, ...}: {
  systemd = {
    services.sync-windows-bootloader = {
      description = "Sync Windows bootloader to Linux ESP";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.rsync}/bin/rsync -a --delete /mnt/win-efi/EFI/Microsoft/ /boot/EFI/Microsoft/";
      };
    };

    paths.sync-windows-bootloader = {
      description = "Watch Windows EFI for bootloader changes";
      pathConfig = {
        PathChanged = "/mnt/win-efi/EFI/Microsoft/Boot/bootmgfw.efi";
        Unit = "sync-windows-bootloader.service";
      };
      wantedBy = ["multi-user.target"];
    };
  };
}
