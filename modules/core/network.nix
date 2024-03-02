{ pkgs, username, lib, ... }:
{
  networking = {
    hostName = "${username}-pc";
    networkmanager.enable = true;
    nameservers = [ "192.168.50.99" ];
    useDHCP = lib.mkDefault true;
  };
}
