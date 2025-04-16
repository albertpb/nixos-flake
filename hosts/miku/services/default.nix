{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)
  ] ++ [
    (import ./keyring.nix)
  ] ++ [
    (import ./jellyfin.nix)
  ] ++ [
    (import ./ssh.nix)
  ] ++ [
    (import ./deluge.nix)
  ];
}
