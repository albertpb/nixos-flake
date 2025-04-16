{ pkgs, username, ... }:
{
  networking.networkmanager = {
    enable = true;
  };

  users.users.${username}.packages = with pkgs; [
    networkmanagerapplet
  ];

  networking.firewall = {
    enable = true;    
    allowedTCPPorts = [ 22 8096 8920 8112 ];
    allowedUDPPorts = [ 1900 7359 ];
  };
}
