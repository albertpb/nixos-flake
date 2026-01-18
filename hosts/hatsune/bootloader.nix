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

    supportedFilesystems = [ "ntfs" ];

    kernelPackages = pkgs.linuxPackages;

    kernelModules = [ "amdgpu" ];
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "i915.fastboot=1"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nvidia.NVreg_UsePageAttributeTable=1"
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
    ];
    consoleLogLevel = 0;
    extraModulePackages = [ ];

    plymouth.enable = false;
    plymouth.theme = "bgrt";

    initrd.verbose = false;
    initrd.availableKernelModules = [ "nvme" "ahci" "thunderbolt" "xhci_pci" "usbhid" "uas" "usb_storage" "sd_mod" ];
    initrd.systemd.enable = true;
  };
}
