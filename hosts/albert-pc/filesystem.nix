{ pkgs, ... }: {
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a2ade383-367f-475e-8d87-33493b1191d2";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/81AA-A4CD";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/806645a7-8976-442f-9e2b-826618b2c983";
      fsType = "ext4";
    };

  fileSystems."/data/vms" =
    { device = "/dev/disk/by-uuid/aa22e5b3-99a1-42fd-9f5d-2df5d8c4ce79";
      fsType = "ext4";
    };

  fileSystems."/data/ai" =
    { device = "/dev/disk/by-uuid/ec329450-ae28-4b80-8172-875aa938a1cf";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/6eaee042-eca4-42f8-a78f-7506eeacdfc0"; }
    ];

  fileSystems."/dev/hugepages/libvirt/1GB" = {
    device = "none";
    fsType = "hugetlbfs";
    options = [ "pagesize=1G" ];
  };
}

