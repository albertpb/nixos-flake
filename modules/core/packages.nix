{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    floorp
    nixpkgs-fmt
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
    glib
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
    nil
    tmuxifier
    nodejs
    yarn
  ] ++ [
    stylua
    lua-language-server
    marksman
  ];
}
