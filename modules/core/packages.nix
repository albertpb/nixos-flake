{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    floorp
    nixpkgs-fmt
    glib # fix nwg-look not aplying changes
    libsecret
    xdg-utils
    pavucontrol
    rnnoise-plugin
    sxiv
    feh
    libnotify
    hwloc
    shotman # take screenshots
    slurp # Select a region in wayland
  ];

  environment.systemPackages = with pkgs; [
    neovim
    ranger
    wget
    killall
    zip
    unzip
  ];
}
