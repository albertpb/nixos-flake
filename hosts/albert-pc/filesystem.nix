{ pkgs, ... }: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4409407b-6fe5-4b88-8ffe-9e623fb71021";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/2C70-2FC9";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/57e02fa0-7e9f-4d42-9d02-e1b6762662f2";
    fsType = "ext4";
  };

  fileSystems."/vms" = {
    device = "/dev/disk/by-uuid/dea1c8db-2866-4f2b-a46b-7dfcad3f1b85";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/fa7588cd-f00a-4466-b210-ecfe46c6ebc4"; }
  ];

  fileSystems."/dev/hugepages/libvirt/1GB" = {
    device = "none";
    fsType = "hugetlbfs";
    options = [ "pagesize=1G" ];
  };
}
