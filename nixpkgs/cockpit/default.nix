{ pkgs, ... }:
{
  cockpit-podman = pkgs.callPackage ./cockpit-podman.nix { };
}
