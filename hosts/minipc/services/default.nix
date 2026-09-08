{ pkgs, ... }:
{
  imports = [
    (import ./ssh.nix)
    (import ./samba.nix)
  ];
}
