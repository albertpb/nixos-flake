{ pkgs, lib, ... }:
{
  boot = {
    tmp = {
      cleanOnBoot = true;
    };

    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };

      timeout = lib.mkDefault 5;

      efi.canTouchEfiVariables = true;

      #grub = {
      #  enable = false;
      #  device = "nodev";
      #  efiSupport = true;
      #  timeoutStyle = "countdown";
      #  theme = null;
      #  splashImage = null;
      #};
    };

    kernelPackages = pkgs.linuxPackages_xanmod;

    supportedFilesystems = [ "ntfs" ];

    # kernelModules = [ "kvm-amd" ];
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "i915.fastboot=1"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "isolcpus=0,16,1,17,2,18,3,19,4,20,5,21,6,22,7,23,15,31,14,30"
    ];
    consoleLogLevel = 0;
    extraModulePackages = [ ];

    plymouth.enable = true;
    plymouth.theme = "bgrt";

    initrd.verbose = false;
    initrd.availableKernelModules = [ "nvme" "ahci" "thunderbolt" "xhci_pci" "usbhid" "uas" "usb_storage" "sd_mod" ];
    initrd.systemd.enable = true;
  };
}
