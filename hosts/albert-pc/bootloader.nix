{ pkgs, lib, ... }: {
  boot = {
    tmp = { cleanOnBoot = true; };

    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = false;
        default = "saved";
      };

      timeout = lib.mkDefault 15;

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

    kernelPackages = pkgs.linuxPackages_6_17;  
      
    kernelModules = [ "k10temp" "nct6775" ];

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "i915.fastboot=1"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      # "amdgpu.dcdebugmask=0x10"
      # "amdgpu.deep_color=0"
      # "amdgpu.aspm=0"
    ];
    consoleLogLevel = 0;
    extraModulePackages = [ ];

    plymouth.enable = true;
    plymouth.theme = "bgrt";

    initrd.verbose = false;
    initrd.availableKernelModules = [
      "nvme"
      "ahci"
      "thunderbolt"
      "xhci_pci"
      "usbhid"
      "uas"
      "usb_storage"
      "sd_mod"
    ];
    initrd.systemd.enable = true;
  };

  specialisation = {
    vm.configuration = {
      boot = {
        kernelParams = [
          "fbcon=rotate:3"
          "isolcpus=0-7,16-23"
          "nohz_full=0-7,16-23"
          "rcu_nocbs=0-7,16-23"
          "housekeeping=8-15,24-31"
        ];
      };
    };
  };
}
