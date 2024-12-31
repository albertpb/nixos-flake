{ pkgs, ... }:
{
  imports = [
    (import ./keyring.nix)
  ] ++ [
    (import ./cockpit.nix)
  ];
}
