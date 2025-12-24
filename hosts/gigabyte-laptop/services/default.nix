{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)
  ];
}
