{...}: {
  systemd.paths.sync-windows-bootloader = {
    description = "Watch Windows EFI for bootloader changes";
    pathConfig = {
      PathChanged = "/mnt/win-efi/EFI/Microsoft/Boot/bootmgfw.efi";
      Unit = "sync-windows-bootloader.service";
    };
    wantedBy = ["multi-user.target"];
  };
}
