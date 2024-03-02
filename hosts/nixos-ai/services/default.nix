{ pkgs, ... }:
{
  imports = [
    (import ./greetd.nix)
  ] ++ [
    (import ./keyring.nix)
  ] ++ [
    (import ./x-server.nix)
  ];
}
