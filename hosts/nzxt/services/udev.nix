{ pkgs, ... }:
{
  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0a31", MODE="0666", GROUP="plugdev"
  '';  
}
