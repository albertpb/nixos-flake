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
  ];

  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    thefuck
    gcc
    ranger
    wget
    killall
    zip
    unzip
    btop
    hwloc
    usbutils
    lshw
    curl
    gzip
    lazygit
    lua-language-server
    stylua
    nil
  ];
}
