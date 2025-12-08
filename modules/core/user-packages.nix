{ pkgs, username, ... }: {
  users.users.${username}.packages = with pkgs; [
    vivaldi
    nixpkgs-fmt
    libsecret
    xdg-utils
    pavucontrol
    rnnoise-plugin
    sxiv
    feh
    libnotify
    mission-center
  ];
} 

