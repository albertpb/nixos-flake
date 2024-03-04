{ pkgs, username, ... }:
{
  #nixos-ai
  users.users.${username}.packages = with pkgs; [
    polybar
    picom
    sxhkd
    rofi
    dunst
    kitty
    feh
    lxappearance
    macchina
  ];

  environment.systemPackages = with pkgs; [
    linuxPackages.nvidia_x11
  ];
}
