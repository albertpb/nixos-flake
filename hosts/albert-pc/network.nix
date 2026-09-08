{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      unmanaged = [
        "interface-name:br0"
        "interface-name:eno2"
      ];
    };

    bridges.br0.interfaces = [ "eno2" ];

    defaultGateway = {
      address = "192.168.50.1";
      interface = "br0";
    };

    nameservers = [ "192.168.50.201" ];

    interfaces = {
      br0 = {
        useDHCP = false;
        ipv4.addresses = [
          {
            address = "192.168.50.90";
            prefixLength = 24;
          }
        ];
      };
      eno2.useDHCP = false;
    };
  };
}
