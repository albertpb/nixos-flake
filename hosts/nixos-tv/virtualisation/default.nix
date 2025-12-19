{ lib, pkgs, config, ... }:
{
  imports = [
    ./vfio.nix
    ./virtualisation.nix
    #    ./libvirt.nix
  ];

  virtualisation = {
    vfio = {
      enable = true;
      IOMMUType = "amd";
      devices = [ "10de:2204" ];
      disableEFIfb = false;
      blacklistNvidia = false;
      ignoreMSRs = true;
      applyACSpatch = false;
    };

    hugepages = {
      enable = true;
      defaultPageSize = "1G";
      pageSize = "1G";
      numPages = 26;
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  programs.virt-manager.enable = true;
}
