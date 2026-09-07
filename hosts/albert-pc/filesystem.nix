{ username, pkgs, ... }: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/fe4fc2fd-ad9c-4195-a083-0f5192fc913c";
    fsType = "ext4";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/37c709eb-aa99-4fe2-b473-40e4fa33e64f";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/F330-C8F2";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/mnt/vms" = {
    device = "/dev/disk/by-uuid/4b63414e-916f-4923-be3e-5b1a92c3f971";
    fsType = "ext4";
  };

  fileSystems."/dev/hugepages/libvirt/1GB" = {
    device = "none";
    fsType = "hugetlbfs";
    options = [ "pagesize=1G" ];
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024;
    }
  ];
}
