{ pkgs, ... }:
let
  keewebgpu = import ./keeweb.nix;
in
{
  home.packages = with pkgs; [
    keewebgpu
  ];
}
