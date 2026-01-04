{ pkgs, ... }: {
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
}
