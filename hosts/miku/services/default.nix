{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)
  ] ++ [
    (import ./keyring.nix)
  ] ++ [
    (import ./ssh.nix)
  ];
}
