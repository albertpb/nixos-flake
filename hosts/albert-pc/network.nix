{ pkgs, username, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };

    defaultGateway = {
      address = "192.168.50.1";
    };

    nameservers = [ "192.168.50.201" ];

    interfaces.eno2.ipv4.addresses = [
      {
        address = "192.168.50.90";
        prefixLength = 24;
      }
    ];
  }; 
  
  users.users.${username}.packages = with pkgs; [
    networkmanagerapplet
  ];
}
