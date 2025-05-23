# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/14a8f3d1-66b1-451f-bbae-d0f83bad784f";
    fsType = "ext4";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/1103ad7c-0633-4aa8-b44a-6f610af4d3a8";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D0FC-3551";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/9c6c0937-bb17-4b36-b014-f8a777f1fe33"; }];

  fileSystems."/mnt/ai1" = {
    device = "/dev/disk/by-uuid/BA5EBD5B5EBD115D";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" ];
  };

  fileSystems."/mnt/ai2" = {
    device = "/dev/disk/by-uuid/049C4A209C4A0D1C";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" ];
  };

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/9C4A76964A766D40";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" ];
  };

}
