{...}: {
  security.pam.services.su = {
    requireWheel = true;
  };
}
