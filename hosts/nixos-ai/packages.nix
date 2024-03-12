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
    glxinfo
  ];

  environment.systemPackages = with pkgs; [
    linuxPackages.nvidia_x11
  ];
}
