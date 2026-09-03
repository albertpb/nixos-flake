{
  pkgs,
  lib,
  ...
}:
{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };

      timeout = 0;

      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];

    kernelPackages = pkgs.linuxPackages_6_12;

    kernelModules = [
      "k10temp"
      "nct6775"
    ];

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "systemd.show_status=false"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "video=efifb:off"
      "video=simplefb:off"
      "pcie_aspm=off"
      "amd_pstate=active"
      # "amdgpu"
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

  # specialisation = {
  #   vm.configuration = {
  #     boot = {
  #       kernelParams = [
  #         "fbcon=rotate:3"
  #         "isolcpus=0-7,16-23"
  #         "nohz_full=0-7,16-23"
  #         "rcu_nocbs=0-7,16-23"
  #         "housekeeping=8-15,24-31"
  #         "irqaffinity=8-15,24-31"
  #       ];
  #     };
  #   };
  # };
}
