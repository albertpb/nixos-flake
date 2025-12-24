{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)
  ]
  ++ [ (import ./udev.nix) ]
  ++ [ (import ./bolt.nix) ];
}
