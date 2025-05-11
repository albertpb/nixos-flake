{ pkgs, username, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };

    #interfaces.eno2.ipv4.addresses = [
    #  {
    #    address = "192.168.50.90";
    #    prefixLength = 24;
    #  }
    #];

    defaultGateway = {
      address = "192.168.50.1";
      interface = "br0";
    };

    nameservers = [ "192.168.50.99" ];
    
    bridges = {
      "br0" = {
        interfaces = [ "eno2" ];
      };
    };

    interfaces.br0.ipv4.addresses = [
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
