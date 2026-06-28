{...}: {
  programs.ssh.extraConfig = ''
    Host server
      HostName asakiyuki.com
      User asakiyuki
      Port 15523
  '';
}