{ pkgs, lib, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };

      timeout = lib.mkDefault 0;

      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";

      grub = {
        enable = false;
        device = "nodev";
        efiSupport = true;
        timeoutStyle = "countdown";
        theme = null;
        splashImage = null;
      };
    };

    kernelModules = [ "kvm-amd" ];
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "i915.fastboot=1"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    consoleLogLevel = 0;
    extraModulePackages = [ ];

    plymouth.enable = true;
    # plymouth.theme = "breeze";

    initrd.verbose = false;
    initrd.availableKernelModules = [ "nvme" "ahci" "thunderbolt" "xhci_pci" "usbhid" "uas" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ "amdgpu" ];
    initrd.systemd.enable = true;
  };
}
