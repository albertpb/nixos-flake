{ pkgs, username, ... }: {
  services = {
    desktopManager.plasma6.enable = true;

    displayManager.sddm.enable = true;

    displayManager.sddm.wayland.enable = true;
  };

  users.users.${username}.packages = with pkgs; [
    kdePackages.xdg-desktop-portal-kde
  ];
}
