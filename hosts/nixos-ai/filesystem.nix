{ config, lib, pkgs, modulesPath, ... }:
{
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/b9050c63-4904-4e74-8a53-bd700f50091a";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/9A13-B70E";
      fsType = "ext4";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/f0c1f465-1a1e-47ec-b93f-12520c03c47e";
      fsType = "ext4";
    };

  swapDevices = [{
    device = "/dev/disk/by-uuid/1b050d88-785a-4870-a53b-12d82ff75408";
  }];
}
