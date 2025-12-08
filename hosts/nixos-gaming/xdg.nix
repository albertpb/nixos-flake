{ pkgs, username, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  users.users.${username}.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr
  ];
}
