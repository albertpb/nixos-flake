{ pkgs, username, ... }: {
  users.users.${username}.packages = with pkgs; [
    floorp
    vivaldi
    nixpkgs-fmt
    libsecret
    xdg-utils
    pavucontrol
    rnnoise-plugin
    sxiv
    feh
    libnotify
  ];
}

