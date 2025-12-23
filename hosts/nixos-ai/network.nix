{ pkgs, username, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };

    defaultGateway = {
      address = "192.168.50.1";
      interface = "enp1s0";
    };

    nameservers = [ "192.168.50.99" ];

    interfaces.enp1s0.ipv4.addresses = [
      {
        address = "192.168.50.91";
        prefixLength = 24;
      }
    ];
  };

  users.users.${username}.packages = with pkgs; [
    networkmanagerapplet
  ];
}
