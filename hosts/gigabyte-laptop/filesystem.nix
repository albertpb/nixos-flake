{ pkgs, ... }:
{
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/03c46186-e909-466a-bc8c-6a153b1ad10a";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/A79E-840C";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/6da72a1b-4143-436c-9f29-bfb210c51c8d";
      fsType = "ext4";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/8ec170f2-b4c8-4af5-967f-29e12cb4e26c"; }];
}
