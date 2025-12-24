{ pkgs, username, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-cosmic
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
    ];

    config.common.default = "cosmic";
  };

}
