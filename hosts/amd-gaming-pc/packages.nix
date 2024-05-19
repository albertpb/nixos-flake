{ pkgs, username, ... }:
{
  # albert-pc
  users.users.${username}.packages = with pkgs; [
    hyprpaper
    mako
    nwg-look
    macchina
    grim # take screenshots
    slurp # Select a region in wayland
    wl-clipboard # screenshot to clipboard
    glxinfo
    vlc
  ];
}
