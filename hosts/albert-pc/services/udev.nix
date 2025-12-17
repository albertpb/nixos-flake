{ pkgs, ... }:
{
  # Keyboard to change settings in browser with hid
  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0a31", MODE="0666", GROUP="plugdev"
  '';  
}
