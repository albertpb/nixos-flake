{ pkgs, ... }: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/809a0078-df7e-4925-bfd0-2434f307ac60";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A73B-EAAA";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/bbfdb741-608d-47c9-b6dc-47dc04dc2cf7";
    fsType = "ext4";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/c1383d83-d6c4-4705-ad8d-a8ca3026cd12"; }];

  fileSystems."/home/albert/games" = {
    device = "/dev/disk/by-uuid/347fb1bb-a50c-41fe-96d9-99e3452b2804";
    fsType = "ext4";
    options = [ "rw" "users" "exec" "umask=000" ];
  };
}
