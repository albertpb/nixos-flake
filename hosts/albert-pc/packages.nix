{ pkgs, username, ... }:
{
  # albert-pc
  users.users.${username}.packages = with pkgs; [
    pinta
    brasero # make iso files
    hyprpaper
    mako
    nwg-look
    swaylock-effects
    macchina
    swayidle
    tidal-hifi
  ];
}
