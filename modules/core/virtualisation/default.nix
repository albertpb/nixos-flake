{ lib, pkgs, config, ... }: {
  imports = [
    ./vfio.nix
    ./virtualisation.nix
    #    ./libvirt.nix
  ];

  virtualisation = {
    vfio = {
      enable = true;
      IOMMUType = "amd";
      devices = [ "10de:2204" "10de:1aef" "10de:2684" "10de:22ba" ];
      disableEFIfb = false;
      blacklistNvidia = true;
      ignoreMSRs = true;
      applyACSpatch = false;
    };

    hugepages = {
      enable = true;
      defaultPageSize = "1G";
      pageSize = "1G";
      numPages = 32;
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
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };

  programs.virt-manager.enable = true;
}
