{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };

    defaultGateway = {
      address = "192.168.50.1";
    };

    nameservers = [ "192.168.50.99" ];

  };

}
