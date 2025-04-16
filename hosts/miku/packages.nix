{ pkgs, username, ... }: {
  # albert-pc
  users.users.${username}.packages = with pkgs; [
    hyprpaper
    hypridle
    mako
    nwg-look
    macchina
    tidal-hifi
    grim # take screenshots
    slurp # Select a region in wayland
    wl-clipboard # screenshot to clipboard
    #rtorrent
  ];
}
