{ pkgs, ... }:
{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/05f4bc63-a94f-4ace-97b2-7471a9615817";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/949c3080-217b-4728-8b92-178f84ad5ba6";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/DAAD-E81C";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/0e6d93fa-ffdb-40f0-954f-ee04bcef70eb"; }
    ];
}
