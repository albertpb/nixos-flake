{ pkgs, username, ... }: {
  users.users.${username}.packages = with pkgs; [
    pinta
    brasero # make iso files
    hyprpaper
    hypridle
    mako
    nwg-look
    macchina
    grim # take screenshots
    slurp # Select a region in wayland
    wl-clipboard # screenshot to clipboard
    vlc
    qmk
    qmk-udev-rules
    dfu-util
    dbgate
    bruno
  ];
}
