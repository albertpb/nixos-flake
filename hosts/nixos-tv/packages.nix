{ pkgs, username, ... }: {
  users.users.${username}.packages = with pkgs; [
    pinta
    nwg-look
    macchina
    grim # take screenshots
    slurp # Select a region in wayland
    wl-clipboard # screenshot to clipboard
    vlc
  ];

  environment.systemPackages = with pkgs; [
    wayland
    wayland-utils
  ];

}
