{ pkgs, username, ... }:
{
  networking.networkmanager = {
    enable = true;
  };

  users.users.${username}.packages = with pkgs; [
    networkmanagerapplet
  ];
}
