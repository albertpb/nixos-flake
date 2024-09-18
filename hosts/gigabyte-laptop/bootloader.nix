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

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "i915.fastboot=1"
      "i915.force_probe=46a3"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "intel_iommu=on"
    ];
    kernelModules = [ "kvm-intel" ];
    consoleLogLevel = 0;
    extraModulePackages = [ ];

    plymouth.enable = true;
    plymouth.theme = "bgrt";

    initrd.verbose = false;
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
    initrd.kernelModules = [ ];
    initrd.systemd.enable = true;
  };
}
