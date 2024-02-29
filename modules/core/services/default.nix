{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)
  ] ++ [
    (import ./keyring.nix)
  ];
}
