{ pkgs, username, ... }: {
  users.users.${username}.packages = with pkgs; [
    pinta
    mako
    nwg-look
    macchina
    vlc
  ];

  environment.systemPackages = with pkgs; [
    onlyoffice-desktopeditors
    wayland
    wayland-utils
  ];
}
