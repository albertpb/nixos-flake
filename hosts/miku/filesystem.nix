{ pkgs, ... }:
{
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/070b75d6-e4c8-43a7-8c53-0dd36ac64bef";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/954B-C0C7";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/49d6e6cd-7cfa-4e10-be1e-7e161d4dd0ae";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/49a9b341-02ba-4a97-8c58-99455dfd933e"; }
    ];

  fileSystems."/mnt/data" = 
    {
      device = "/dev/disk/by-uuid/8C2C4CDC2C4CC346";
      fsType = "ntfs-3g";
    };
 
}
