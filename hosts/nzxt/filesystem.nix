{ pkgs, ... }: {
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/2c8daded-8843-4c12-96cf-3a3f8d7237a6";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B5A4-F875";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/2a77d53f-9271-4055-85bf-cedc4dbfcb73";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/2112eb1b-0db2-405c-9a25-bcec6c9727a3"; }
    ];

}

