{ lib, pkgs, config, ... }: 
let
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") { };
in
{
  imports = [
    ./vfio.nix
    ./virtualisation.nix
    #    ./libvirt.nix
  ];

  virtualisation = {
    vfio = {
      enable = true;
      IOMMUType = "intel";
      # devices = [ "10de:28a0" "10de:22be" ];
      devices = [];
      disableEFIfb = false;
      blacklistNvidia = true;
      ignoreMSRs = true;
      applyACSpatch = false;
    };

    hugepages = {
      enable = true;
      defaultPageSize = "1G";
      pageSize = "1G";
      numPages = 20;
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (unstable.OVMFFull.override {
            secureBoot = true;
            tpmSupport = true;
            msVarsTemplate = true;
          }).fd
        ];
      };
    };
  };

  programs.virt-manager.enable = true;
}
