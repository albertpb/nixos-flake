{ pkgs, username, ... }: {
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
    vlc
    moonlight-qt
  ];

  environment.systemPackages = with pkgs; [
    wayland
    wayland-utils
    hyprpolkitagent
  ];

}
