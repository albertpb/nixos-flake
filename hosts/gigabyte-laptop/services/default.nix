{ pkgs, ... }:
{
  imports = [
    (import ./dms-greeter.nix)
  ];
}
