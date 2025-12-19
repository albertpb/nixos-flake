{ pkgs, username, ... }:
{
  # albert-pc
  users.users.${username}.packages = with pkgs; [
    pinta
    hyprpaper
    hypridle
    mako
    nwg-look
    macchina
    grim # take screenshots
    slurp # Select a region in wayland
    wl-clipboard # screenshot to clipboard
    brave
    vlc
    moonlight-qt
  ];

  environment.systemPackages = with pkgs; [
    wayland
    wayland-utils
  ];

}
