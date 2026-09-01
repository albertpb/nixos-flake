{ pkgs, ... }: {
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/fe4fc2fd-ad9c-4195-a083-0f5192fc913c";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/37c709eb-aa99-4fe2-b473-40e4fa33e64f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F330-C8F2";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];
}
