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
    grim # take screenshots
    slurp # Select a region in wayland
    wl-clipboard # screenshot to clipboard
    glxinfo
    brave
    vlc
  ];
}
