{pkgs, ...}: {
  services-menu.p7zip-extract = {
    "Desktop Entry" = {
      Type = "Service";
      MimeType = "application/zip";
      Actions = "ExtractFile";
    };

    "Desktop Action ExtractFile" = {
      Name = "Extract here";
      Exec = "${pkgs.p7zip}/bin/7z x \"%F\" -o*";
    };
  };
}
