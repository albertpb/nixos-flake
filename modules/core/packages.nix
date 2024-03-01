{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [
    floorp
    nwg-look
    nixpkgs-fmt
    glib # fix nwg-look not aplying changes
    libsecret
    xdg-utils
    pavucontrol
    rnnoise-plugin
  ];
}
