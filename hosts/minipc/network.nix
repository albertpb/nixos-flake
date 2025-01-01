{ pkgs, username, lib, ... }:
{
  networking = {
    hostName = "${username}-pc";
    networkmanager.enable = true;
    nameservers = [ "192.168.50.99" ];
    useDHCP = lib.mkDefault false;
    
    interfaces = {
      enp1s0.ipv4.addresses = [{
        address = "192.168.50.201";
        prefixLength = 24;
      }];
    };
    defaultGateway = {
      address = "192.168.50.1";
      interface = "enp1s0";
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 9443 8000 6379 27017 ];
    };
 };
}
