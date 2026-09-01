{ pkgs, ... }: {
  security = {
    polkit.enable = true;
    rtkit.enable = true;

    pki.certificateFiles = [
      ./root.crt
    ];
  };

  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
}
