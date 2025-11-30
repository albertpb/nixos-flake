{ pkgs, username, ... }: {
  services = {
    desktopManager.plasma6.enable = true;

    displayManager.sddm.enable = true;

    displayManager.sddm.wayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-wlr
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };

  users.users.${username}.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    kdePackages.xdg-desktop-portal-kde
    xdg-desktop-portal-wlr
  ];

}
