{ pkgs, ... }:
{
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/1628ea1d-6f19-4653-a2bd-e1de6efcc76f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/5A6E-59CA";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/8f15564e-5833-4c6e-9f68-ac677996325b";
      fsType = "ext4";
    };

  fileSystems."/vms" =
    {
      device = "/dev/disk/by-uuid/d7f4e189-1858-42e5-af9a-ad7852d56695";
      fsType = "ext4";
    };

  #fileSystems."/data" =
  #  {
  #    device = "/dev/disk/by-uuid/9C4A76964A766D40";
  #    fsType = "ntfs-3g";
  #    options = [ "rw" "uid=1000" ];
  #  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/e4abad48-6b98-4468-93b5-aacd3a72a934"; }];
}
