{ pkgs, ... }:
{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/37311599-2d09-493c-94ea-fc00182f1a56";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/a98f16a3-7938-4a1b-a97a-240b89cb95e4";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B164-2A4E";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/3cc3d992-40e4-4863-ae5c-1e13e039afc1"; }
    ];

}
