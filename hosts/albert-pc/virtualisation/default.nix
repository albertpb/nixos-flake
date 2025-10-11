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
      devices = [ 
        "10de:2684"  # GPU
        "10de:22ba"  # Audio
        "10de:2b85"  # GPU
        "10de:22e8"  # Audio
        "1987:5018"  # Phison NVMe 1
        "1022:43f5"  # AMD PCIe bridge for INNOGRIT NVMe
        "1dbe:5236"  # INNOGRIT NVMe
        "1022:43f5"  # AMD PCIe bridge for USB
        "1022:43f7"  # USB 3.2
      ];
      disableEFIfb = false;
      blacklistNvidia = true;
      ignoreMSRs = true;
      applyACSpatch = false;
    };

    hugepages = {
      enable = false;
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
