# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [
      (modulesPath + "/profiles/qemu-guest.nix")
    ] ++ [
      (import ./filesystem.nix)
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

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = { 
    modesetting.enable = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
