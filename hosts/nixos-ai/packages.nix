{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    polybar
    picom
    sxhkd
    rofi
    dunst
    kitty
    feh
    lxappearance
  ];

  environment.systemPackages = with pkgs; [
    linuxPackages.nvidia_x11
  ];
}
