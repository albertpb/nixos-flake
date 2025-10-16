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
  ];

  environment.systemPackages = with pkgs; [ linuxPackages.nvidia_x11 ];
}
