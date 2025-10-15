{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)
  ] ++ [
    (import ./keyring.nix)
  ] ++ [
    (import ./sunshine.nix)
  ] ++ [
    (import ./printer.nix)
  ];
}
