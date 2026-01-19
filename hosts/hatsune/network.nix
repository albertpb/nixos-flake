{ pkgs, username, ... }: {
  networking = {
    networkmanager = { enable = true; };

    defaultGateway = {
      address = "192.168.50.1";
      interface = "eno1";
    };

    nameservers = [ "192.168.50.99" ];

    interfaces.eno1.ipv4.addresses = [{
      address = "192.168.50.55";
      prefixLength = 24;
    }];

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 8080 11434 ];
      allowedUDPPorts = [ ];
    };

  };

  users.users.${username}.packages = with pkgs; [ networkmanagerapplet ];
}
