{...}: {
  services.fail2ban = {
    ignoreIP = [
      "192.168.0.0/16"
    ];
  };
}
