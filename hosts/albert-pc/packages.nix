{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    pinta
    brasero # make iso files
    hyprpaper
    mako
    nwg-look
    swaylock-effects
    macchina
  ];
}
