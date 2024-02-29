{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  console = {
    font = "lat2-16";
    earlySetup = true;
    colors = [
      "171d23"
      "1d252c"
      "28323a"
      "526270"
      "b7c5d3"
      "d8e2ec"
      "f6f6f8"
      "fbfbfd"
      "f7768e"
      "ff9e64"
      "b7c5d3"
      "9ece6a"
      "89ddff"
      "7aa2f7"
      "bb9af7"
      "bb9af7"
    ];
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/597b51da-d480-4fbd-a3d0-f20569dfcbf6";
      fsType = "ext4";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/8f15564e-5833-4c6e-9f68-ac677996325b";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/6D86-6466";
      fsType = "vfat";
    };

  fileSystems."/vms" =
    {
      device = "/dev/disk/by-uuid/d7f4e189-1858-42e5-af9a-ad7852d56695";
      fsType = "ext4";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/eabe773d-4453-4844-b234-ac795879d7a2"; }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
