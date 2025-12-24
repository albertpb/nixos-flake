{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)
  ]
  ++ [
    (import ./ssh.nix)
  ];
}
