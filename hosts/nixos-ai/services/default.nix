{ pkgs, ... }:
{
  imports = [
    (import ./keyring.nix)
  ] ++ [
    (import ./greetd.nix)	
  ] ++ [
    (import ./sunshine.nix)
  ] ++ [
    (import ./printer.nix)
  ] ++ [
    (import ./ollama.nix)
  ];
}
